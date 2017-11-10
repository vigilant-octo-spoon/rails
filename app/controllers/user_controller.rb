class UserController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
    @user = User.new(user_params)
    @user.save
    render json: @users, status: :created
  end

  def show
  end

  def update
  end

  def destroy
      @user = User.where(id: params(:id)).first
      if @user.destroy
        head(:ok)
      else
        head(:fail)
      end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :studies, :bio,:name,:last_name,:admin)
  end

end
