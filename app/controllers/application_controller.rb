class ApplicationController < ActionController::Base
  before_action :authenticate_request!
  
  def authenticate_request!
    unless session[:user_id]
    	@user = ''
    	redirect_to root_path
      # render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      # return
    else
      @user = User.find(session[:user_id])
    end
  end
end
