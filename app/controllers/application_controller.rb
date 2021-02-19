class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def home
    end
    def admin_access?
        return head(:forbidden) unless current_user.admin?
    end

end
