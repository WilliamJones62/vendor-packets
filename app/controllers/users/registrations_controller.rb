class User7s::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]
# Only skip if admin. How do I say that?
  def new
    if current_user7.admin?
      @user = User7.new
    end
  end

  def create
    if current_user7.admin?
      @user = User7.new(user_params)
       if @user.save!
         redirect_to root_path
       end
     end
  end

  private

  def user_params
  params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
