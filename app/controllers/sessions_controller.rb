class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user=User.find_by(email: user_params[:email])

    if user.present?
      session[:user_id] = user.id

      redirect_to root_path, notice: 'You are now logged in'
    else
      flash.now[:alert] = 'Incrorrent email or password'

      render :new
    end
  end
end
