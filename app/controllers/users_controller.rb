class UsersController < ApplicationController

  def index
    @users = User.users_only
  end

  def show
    @user = User.find(params[:id])
  end
end
