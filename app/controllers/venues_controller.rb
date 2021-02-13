class VenuesController < ApplicationController
    before_action :set_venue, only: %i[ show edit update destroy ]

    def index
        @venues = Venue.all
    end

    def show
    end

    def edit
    end

    def update
        if @venue.update(strong_params(:name, :location, :capacity, :cost, :description))
            redirect_to @venue
        else
            #flash
            render :edit
        end
    end

    def new
        @venue = Venue.new
    end

    def create
        @venue = Venue.new(strong_params(:name, :location, :capacity, :cost, :description))
        if @venue.save
            # session[:venue_id] = @venue.id
            redirect_to @venue
        else
            #flash
            render :new
        end
    end

    def destroy
        @venue.destroy
        #flash
        redirect_to venues_path
    end



    private

    def strong_params(*args)
        params.require(:venue).permit(*args)
    end

    def set_venue
        @venue = Venue.find_by(id: params[:id])
    end
end
