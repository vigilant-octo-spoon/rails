class UserController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

end
