class FollowsMethodologyController < ApplicationController

  def index
    Rails.logger.debug("....................................................................................")
    Rails.logger.debug("My object: #{request.headers['token'].inspect}")
    Rails.logger.debug("....................................................................................")

    if request.headers["token"].present?
      auth_token = request.headers["token"]
    else
      auth_token = nil
    end
    @user = User.where(authentication_token: auth_token).first
    Rails.logger.debug("....................................................................................")
    Rails.logger.debug("My object: #{@user.inspect}")
    Rails.logger.debug("....................................................................................")

    if @user
      folow_met = FollowsMethodology.where(user_id: @user.id)
      render json: folow_met, status: :ok
    else
      render json: {"message": "Esto es información privada"}, status: :fail
    end
  end

  def destroy
    if request.headers["token"].present?
      auth_token = request.headers["token"]
    else
      auth_token = nil
    end
    @user = User.where(authentication_token: auth_token).first
    if @user
      folow_met = FollowsMethodology.find_by_methodology_id_and_user_id(params[:id],@user.id)
      if folow_met.destroy
        head(:ok)
      else
        render json: {"message": "Esto es información privada"}, status: :fail
      end
      render json: folow_met, status: :ok
    else
      render json: {"message": "Esto es información privada"}, status: :fail
    end
  end

  def create
    if request.headers["token"].present?
      auth_token = request.headers["token"]
    else
      auth_token = nil
    end
    @user = User.where(authentication_token: auth_token).first
    if @user
      folow_met= FollowsMethodology.create(user_id: params[:user],methodology_id: params[:metodology])
      if folow_met.save
        render json: {"message": "Seguimiento con exito","idFolow": folow_met.id }, status: :fail
      else
        render json: {"message": "Esto es información privada"}, status: :fail
      end
      render json: folow_met, status: :ok
    else
      render json: {"message": "Esto es información privada, usuario no encontrado"}, status: :fail
    end
  end

end
