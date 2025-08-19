class PostNotificationJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    User.find_each do |user|
      PostMailer.post_created(post, user).deliver_later
    end
  end
end
