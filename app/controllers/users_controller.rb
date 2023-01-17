class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)

    @user = User.new(user_params)

    if @user.save 
      redirect_to root_path, notice: 'User created successfully'
    else
      flash.now[:alert] = 'You filled incorrect form'
      render :new
    end
  end
end
