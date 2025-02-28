class UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    @user = current_user
    render :show
  end

  def show
  end

  def edit
  end

  def destroy
    terminate_session
    return unless @user.destroy

    redirect_to root_path, notice: "Account has been successfully deleted."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
