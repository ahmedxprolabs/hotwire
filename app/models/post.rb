class Post < ApplicationRecord
  after_create_commit :notify_users

  def self.ransackable_attributes(auth_object = nil)
    %w[title body created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def notify_users
    PostNotificationJob.perform_later(self.id)
  end
end
