class PracMailer < ApplicationMailer
    default from: 'api@example.com', to: ENV['USER_EMAIL']

    def welcome_email
        mail(subject: 'A welcome email!')
    end

    def studio_mail
        @studios = Studio.all
        mail(subject: 'Here is a list of game studios!')
    end
end
