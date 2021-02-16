class SessionsController < ApplicationController
    def create
        user = User.find_by(id: params[:id])

        if user
            session[:user_id] = user.id
         
        end

    end 
end  