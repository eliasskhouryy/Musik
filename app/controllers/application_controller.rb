class ApplicationController < ActionController::Base
    before_action :fetch_user

    def fetch_user
        @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
        session[:user_id] = nil unless @current_user.present? #logs out non-existant users
    end

    def check_for_login
        redirect_to login_path unless @current_user.present?
    end

    def check_for_logout
        redirect_to feeds_path if @current_user.present?
    end

    def check_for_admin
        redirect_to login_path unless (@current_user.present? && @current_user.admin?) #can use ? for admin as its a boolean
    end

    def search
        @query = params[:query]
        @users = User.where("users.name iLIKE ?", ["%#{@query}%"])
        render :results
    end 
end
