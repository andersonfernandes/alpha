class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def show
    redirect_to :my_profile if @user == current_user
    set_posts @user
  end

  def my_profile
    set_posts current_user
  end

  private

    def set_user
      @user = User.find params[:id]
    end

    def set_posts user
      @posts = user.posts.reverse
    end
end
