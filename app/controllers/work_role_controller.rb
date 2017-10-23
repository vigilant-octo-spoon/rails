class WorkRoleController < ApplicationController
  def index
    if request.headers["token"].present?
      auth_token = request.headers["token"]
    else
      auth_token = nil
    end
    id_follow = params[:follows_methodology_id]
    @user = User.where(authentication_token: auth_token).first
    if @user && FollowsMethodology.where(user_id: @user.id,id: id_follow)
      @work_roles = WorkRole.where(follows_methodologies_id: id_follow).select(:id,:name,:role)
      json_response = { :work_roles => @work_roles}.to_json
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
      rol = WorkRole.create(follows_methodologies_id: id_follow,name: params[:name],role: params[:role])
      if rol.save
        render json: {"message": "Rol de trabajo creado exitosamente","idWorkRole": rol.id}, status: :fail
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
      rol = WorkRole.where(follows_methodologies_id: id_follow,id: params[:id]).first
      Rails.logger.debug("My object: #{rol.inspect}")
      Rails.logger.debug("My object: #{rol.inspect}")
      Rails.logger.debug("My object: #{rol.inspect}")
      if rol.destroy
        render json: {"message": "Rol de trabajo eliminado exitosamente"}, status: :fail
      else
        render json: {"message": "Hubo ub error"}, status: :fail
      end
    else
      render json: {"message": "Esto es información privada"}, status: :fail
    end
  end

end
