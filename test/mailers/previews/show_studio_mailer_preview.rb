# Preview all emails at http://localhost:3000/rails/mailers/prac_mailer
class ShowStudioMailerPreview < ActionMailer::Preview
  def show_studio
    @studio = Studio.first
    ShowStudioMailer.with(studio: @studio).show_studio
  end

  def show_games
    @studio = Studio.first
    ShowStudioMailer.with(studio: @studio).show_games
  end
end
