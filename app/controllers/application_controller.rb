class ApplicationController < ActionController::API

  private

  def current_user
    @current_user ||= User.find_by(token: params[:token])
  end

  def require_user
    render json: {error: "You need to be logged in to do this."} unless current_user
  end

end
