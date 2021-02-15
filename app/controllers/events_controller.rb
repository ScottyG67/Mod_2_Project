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
            byebug
            if @event.update(strong_params(:title,:time, :description, :durations_hours)) 
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

        def addguest
            @userevent = UserEvent.new(event_id: params[:event][:event_id],user_id: params[:event][:user_ids])
            if @userevent.save
                redirect_to user_path(User.find_by(id: params[:event][:user_ids]))
            else
                render :show
            end
        end
    
    
    private 
     def strong_params(*args) 
        params.require(:event).permit(*args)
     end 
    
     def set_event
        @event = Event.find_by(id: params[:id])
     end 
    
        
end
    

