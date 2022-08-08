class PostsController < ApplicationController

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    if post.valid?
      post.update(post_params)
      render json: post
    else
      render json:{ errors: post.errors}, status: :unprocessible_entity
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

end
