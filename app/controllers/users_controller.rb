class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    
    def index
        @users = User.all
    end

    def show
        # if params[:id] == current_user.id.to_s
        #     render :myprofile
        # end
        # #note: show can error when event is created with no guests (expects host to be a guest)
    end

    def edit
        authorized_user_access?
    end

    def picture
        authorized_user_access?
        @user = User.find_by(id: params[:id])
    end


    def updatepicture
        byebug

        @user = User.find_by(id: params[:id])
        byebug
        @user.avatar.purge
        @user.avatar.attach(params[:user][:avatar])
        redirect_to @user
    end

    def update

        if @user.update(strong_params(:name, :email, :bio, :password))
            redirect_to @user
        else
            #flash
            render :edit
        end
    end

    def new
        admin_access?
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

    def admin
        admin_access?
    end



    private

    def strong_params(*args)
        params.require(:user).permit(*args)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end
    


    def authorized_user_access?
        return head(:forbidden) unless current_user.admin? || current_user.id.to_s == params[:id]
    end




end
