class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = find_camper
        render json: camper, serializer: CamperwithactivitiesSerializer
    end

    def create
        new_camper = Camper.create!(camper_params)
        render json: new_camper, status: :created
    end

    private

    def camper_params
        params.permit(:name, :age)
    end
    
    def find_camper
        Camper.find(params[:id])
    end


end
