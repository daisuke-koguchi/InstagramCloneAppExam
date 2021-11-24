class ContactMailer < ApplicationMailer
  def contact_mail(blog)
    @blog = blog
    mail to: ENV['SEND_MAIL'], subject:"写真投稿完了のお知らせ"
  end
end
