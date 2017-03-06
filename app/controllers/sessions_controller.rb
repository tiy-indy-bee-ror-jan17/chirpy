class SessionsController < ApplicationController

  def create
    @user = User.find_by(token: params[:token])&.authenticate(params[:password])
    if @user
      render json: @user, serializer: UserExpandedSerializer
    else
      render json: {error: "Incorrect credentials"}, status: 401
    end
  end

end
