class ConditionController < ApplicationController
  def index
    if request.headers["token"].present?
      auth_token = request.headers["token"]
    else
      auth_token = nil
    end
    id_follow = params[:follows_methodology_id]
    @user = User.where(authentication_token: auth_token).first
    if @user && FollowsMethodology.where(user_id: @user.id,id: id_follow)
      @conditions = Condition.where(follows_methodologies_id: id_follow).select(:id,:item,:info)
      json_response = { :conditions => @conditions}.to_json
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
      con = Condition.create(follows_methodologies_id: id_follow,item: params[:item],info: params[:info])
      if con.save
        render json: {"message": "Condicion de planificacion creada exitosamente","idCondition": con.id}, status: :fail
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
      con = Condition.where(follows_methodologies_id: id_follow,id: params[:id]).first
      if con.destroy
        render json: {"message": "Condicion de planificacion eliminada exitosamente"}, status: :fail
      else
        render json: {"message": "Hubo ub error"}, status: :fail
      end
    else
      render json: {"message": "Esto es información privada"}, status: :fail
    end
  end
end
