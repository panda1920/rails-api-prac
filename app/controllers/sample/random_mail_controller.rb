class Sample::RandomMailController < ApplicationController
    around_action :set_locale

    def send_random_mail
        PracMailer.welcome_email.deliver_now
        render plain: "random mail in #{@locale}!"
    end

    def send_studio_mail
        PracMailer.studio_mail.deliver_now
        render plain: "studio mail in #{@locale}!"
    end
    
    private
    
    def set_locale(&action)
        @locale = params[:locale] || I18n.default_locale
        I18n.with_locale(@locale, &action)
    end
end
