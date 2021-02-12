class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    def index
        @users = User.all
    end

    def show
    end

    def edit
    end

    def update
        if @user.update(strong_params(:name, :email, :password, :bio))
            redirect_to @user
        else
            render :edit
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(strong_params(:name))
        if @user.save
            # session[:user_id] = @user.id
            redirect_to @user
        else
            render :new

        end

    end


    private

    def strong_params(*args)
        params.require(:user).permit(*args)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end


#     <!--<h2> Welcome, <%= User.find(session[:user_id]).name %> </h2> -->

# <!--<h4><%=link_to "View My Profile", user_path(session[:user_id])%></h4>-->

end