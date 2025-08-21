class PostMailer < ApplicationMailer
  default from: "ahmed.rasul@xprolabs.com"

  def post_created(post, user)
    @post = post
    @user = user
    mail(to: @user.email, subject: "A new post was created!")
  end
end
