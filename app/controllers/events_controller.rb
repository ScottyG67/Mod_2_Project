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
            if @event.update(strong_params(:title,:time, :description, :durations_hours, :user_ids)) 
                redirect_to @event
            else 
                #flash
                render :edit
            end 
        end
    
        def new
            @event = Event.new
        end 
    
        def create
            @event = Event.new(strong_params(:title,:time, :description, :durations_hours, :caterer_id, :venue_id))
            if @event.save
                byebug
                UserEvent.create(event_id: @event.id, user_id: params[:event][:host], organizer: true)
                redirect_to @event
            else 
                #flash
                render :new
            end 
        end 
    
        def destroy
            @event.destroy
            #flash
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
    

