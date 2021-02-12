class CaterersController < ApplicationController
    before_action :set_caterer, only: %i[show edit update create destroy]
    def index
        @caterers = Caterer.all
    end 

    def show
    end 

    def edit
    end 

    def update
        if @caterer.update(strong_params(:name,:food_type, :cost_per_head, :description)) 
            redirect_to @caterer
        else 
            render :edit
        end 
    end

    def new
        @caterer = Caterer.new
    end 

    def create
        @caterer = Caterer.new(strong_params(:name,:cost_per_head, :description))
        if @caterer.save
            redirect_to @caterer
        else 
            render :new
        end 
    end 

    def destroy
        @caterer.destroy
        redirect_to caterers_path
    end


private 
 def strong_params(*args) 
    params.require(:caterer).permit(*args)
 end 

 def set_caterer
    @caterer = Caterer.find_by(id: params[:id])
 end 

    
end