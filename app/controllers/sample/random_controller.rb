class Sample::RandomController < ApplicationController
    def get_random
        data = RandomDataCreator.createRandomData()
        render json: data, status: 200
    end
end
