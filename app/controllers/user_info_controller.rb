class UserInfoController < Devise::RegistrationsController 

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :bio, :last_name, :pseudo, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :bio, :pseudo, :email, :password, :password_confirmation, :current_password)
  end
end
