class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation,:phone_number)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,:phone_number,
                                 :password_confirmation, :current_password)
  end
end
