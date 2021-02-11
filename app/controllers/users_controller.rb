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
        @user = user.new
    end

    def create
        byebug
    end


    private

    def strong_params(*args)
        params.require(:user).permit(*args)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end

end
