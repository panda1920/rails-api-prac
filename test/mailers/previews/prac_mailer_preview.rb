# Preview all emails at http://localhost:3000/rails/mailers/prac_mailer
class PracMailerPreview < ActionMailer::Preview
  def welcome_email
    PracMailer.welcome_email
  end

  def studio_mail
    PracMailer.studio_mail
  end
end
