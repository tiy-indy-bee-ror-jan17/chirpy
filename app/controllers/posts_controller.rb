class PostsController < ApplicationController

  before_action :require_user, only: [:create]

  def index
    if current_user
      @posts = current_user.timeline
    else
      @posts = Post.all
    end
    render json: @posts, scope: current_user, scope_name: :current_user
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      render json: @post
    else
      render json: {errors: @post.errors.full_messages}, status: 400
    end
  end

  private

  def post_params
    params.permit(:body)
  end

end
