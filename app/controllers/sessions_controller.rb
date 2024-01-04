class SessionsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def new
  end

  def create
    if user = User.authenticate_by(session_params)
      login user
      redirect_to root_path, notice: 'You have been logged in successfully!'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'You have been logged out successfully!'
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
