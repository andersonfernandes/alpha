class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def create
    @post = Post.new post_params

    if @post.save
      flash.now[:notice] = 'Content successfully posted'
    end
  end

  private

    def post_params
      params.require(:post).permit(:text, :image)
                           .merge({ user_id: current_user.id })
    end
end
