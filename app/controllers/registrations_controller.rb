class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: [ :new, :create ]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      start_new_session_for @user
      redirect_to root_path
    else
      redirect_to new_registration_path, errors: @user.errors
    end
  end

  private
    def user_params
      params.permit(:email_address, :username, :password, :password_confirmation)
    end
end
