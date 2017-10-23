class BroadcastController < ApplicationController

  def index
    if request.headers["token"].present?
      auth_token = request.headers["token"]
    else
      auth_token = nil
    end
    id_follow = params[:follows_methodology_id]
    @user = User.where(authentication_token: auth_token).first
    if @user && FollowsMethodology.where(user_id: @user.id,id: id_follow)
      @broadcasts = Broadcast.where(follows_methodologies_id: id_follow).select(:id,:moment_of_implementation,:audience,:diffusion_channel,:objective)
      json_response = { :broadcasts => @broadcasts}.to_json
      render json: json_response, status: :ok
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
    id_follow = params[:follows_methodology_id]
    @user = User.where(authentication_token: auth_token).first
    if @user && FollowsMethodology.where(user_id: @user.id,id: id_follow)
      broads = Broadcast.create(follows_methodologies_id: id_follow,moment_of_implementation: params[:moment_of_implementation],audience: params[:audience],diffusion_channel: params[:diffusion_channel],objective: params[:objective])
      if broads.save
        render json: {"message": "Difucion creada exitosamente","idBroadcast": broads.id}, status: :fail
      else
        render json: {"message": "Hubo ub error"}, status: :fail
      end
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
    id_follow = params[:follows_methodology_id]
    @user = User.where(authentication_token: auth_token).first
    if @user && FollowsMethodology.where(user_id: @user.id,id: id_follow)
      broads = Broadcast.where(follows_methodologies_id: id_follow,id: params[:id]).first
      if broads.destroy
        render json: {"message": "Difucion eliminada exitosamente"}, status: :fail
      else
        render json: {"message": "Hubo ub error"}, status: :fail
      end
    else
      render json: {"message": "Esto es información privada"}, status: :fail
    end
  end

end
