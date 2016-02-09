class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def create
    @post = Post.new post_params

    if @post.save
      current_user.posts.reload
      render :create
    else
      flash[:alert] = 'This post cannot be posted'
      render :create_fail
    end
  end

  private

    def post_params
      params.require(:post).permit(:text, :image)
                           .merge({ user_id: current_user.id })
    end
end
