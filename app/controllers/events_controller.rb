class EventsController < ApplicationController
        before_action :set_event, only: %i[show edit update create destroy]

        def index
            @events = Event.all
        end 
    
        def show
            if !@event.host
                #flash: "Host not assigned. Please update."
                redirect_to edit_event_path(@event)
            end
        end 
    
        def edit
        end 
    
        def update
            if @event.update(strong_params(:title,:time, :description, :durations_hours)) 
                swap_host
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
            redirect_to events_path
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

     def swap_host
        if UserEvent.find_by(organizer: true, event_id: @event.id)
            @old_host = UserEvent.find_by(organizer: true, event_id: @event.id)
            @old_host.organizer = false
            @old_host.save
        end
        @new_host = UserEvent.find_or_create_by(event_id: @event.id, user_id: params[:event][:host])
        @new_host.organizer = true
        @new_host.save
     end

    
        
end
    

