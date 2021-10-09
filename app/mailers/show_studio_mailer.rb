class ShowStudioMailer < ApplicationMailer
  default from: 'api@example.com', to: ENV['USER_EMAIL']
  layout 'custom_mailer'

  def show_studio
    @studio = params[:studio]
    mail(subject: "Displaying info of studio ##{@studio.id}")
  end

  def show_games
    @studio = params[:studio]
    mail(subject: "Listing out games associated with studio ##{@studio.id}")
  end
end
