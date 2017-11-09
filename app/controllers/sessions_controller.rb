class SessionsController < ApplicationController

  def create

    user = User.where(email: params[:email]).first
    Rails.logger.debug("My object: #{user}")
    user.save
    if user&.valid_password?(params[:password])
      if params[:admin].present?
        auth_admin = request.params[:admin]
      else
        auth_admin = false
      end
      if auth_admin
        if user.admin
          render json: user.as_json(only: [:id,:email, :name, :last_name, :authentication_token]), status: :created
        else
          render json: {"message": "El usuario no es administrador"}, status: :unauthorized
        end
      else
        render json: user.as_json(only: [:id,:email, :name, :last_name, :authentication_token]), status: :created
      end
    else
      render json: {"message": "Contraseña o clave incorrecta"}, status: :unauthorized
    end
  end

  def destroy
  end


end
