class CustomDevise::RegistrationsController < Devise::RegistrationsController
  def update
    if @user.update user_params
      flash[:notice] = 'User successfully updated'
      redirect_to user_path(current_user)
    else
      flash[:alert] = 'The user cannot be updated'
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :profile_image)
    end
end
