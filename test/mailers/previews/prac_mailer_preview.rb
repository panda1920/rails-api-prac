# Preview all emails at http://localhost:3000/rails/mailers/prac_mailer
class PracMailerPreview < ActionMailer::Preview
  
  # method name can be arbitrary
  # does not have to correspond to the underlying mailer methods
  def welcome1
    PracMailer.welcome_email
  end

  def studio_mail
    PracMailer.studio_mail
  end
end
