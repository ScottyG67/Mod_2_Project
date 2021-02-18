class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    
    def index
        @users = User.all
    end

    def show
        #note: show can error when event is created with no guests (expects host to be a guest)
    end

    def edit
    end

    def update
        if @user.update(strong_params(:name, :email, :password, :bio))
            redirect_to @user
        else
            #flash
            render :edit
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(strong_params(:name, :email, :password, :bio))
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            #flash
            render :new
        end
    end

    def destroy
        @user.destroy
        #flash
        redirect_to users_path
    end



    private

    def strong_params(*args)
        params.require(:user).permit(*args)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end




end
