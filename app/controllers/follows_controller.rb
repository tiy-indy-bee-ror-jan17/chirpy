class FollowsController < ApplicationController

  before_action :require_user

  def create
    @user = User.find(params[:id])
    current_user.follow!(@user)
    render json: @user, scope: current_user, scope_name: :current_user
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
    render json: @user, scope: current_user, scope_name: :current_user
  end

end
