class Sample::GamesController < ApplicationController
    def index
        render json: Game.all, status: 200
    end
end
