class EventsController < ApplicationController
        before_action :set_event, only: %i[show edit update create destroy]
        def index
            @events = Event.all
        end 
    
        def show
        end 
    
        def edit
        end 
    
        def update
            if @event.update(strong_params(:title,:time, :description, :durations_hours)) 
                redirect_to @caterer
            else 
                render :edit
            end 
        end
    
        def new
            @event = Event.new
        end 
    
        def create
            @event = Event.new(strong_params(:title,:time, :description, :durations_hours))
            if @event.save
                redirect_to @event
            else 
                render :new
            end 
        end 
    
        def destroy
            @event.destroy
            redirect_to caterers_path
        end
    
    
    private 
     def strong_params(*args) 
        params.require(:event).permit(*args)
     end 
    
     def set_event
        @event = Event.find_by(id: params[:id])
     end 
    
        
end
    

