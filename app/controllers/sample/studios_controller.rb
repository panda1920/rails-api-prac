class Sample::StudiosController < ApplicationController
    def index
        render json: Studio.all, status: 200
    end

    def get_info
        studio = Studio.find_by id: params[:id]
        render json: studio, status: 200
    end

    def first
        render json: Studio.first
    end

    def last
        render json: Studio.last
    end
end
