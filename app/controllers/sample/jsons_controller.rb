class Sample::JsonsController < ApplicationController
    around_action :switch_locale, only: [:get_json]

    def index
    end

    def get_json
        @studios = Studio.all
    end

    private

    def switch_locale(&action)
        locale = params[:locale] || I18n.default_locale
        I18n.with_locale(locale, &action)
    end
end
