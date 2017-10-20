class SessionsController < ApplicationController

  def create

    Rails.logger.debug("email: #{params[:email]}")
    user = User.where(email: params[:email]).first
    Rails.logger.debug("My object: #{user}")
    user.save
    if user&.valid_password?(params[:password])
      render json: user.as_json(only: [:id,:email, :name, :last_name, :authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
  end


end
