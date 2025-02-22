class ProfileController < ApplicationController
  before_action :set_user, except: [ :index ]

  def index
    @user = current_user
    render :show
  end

  def show; end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
