class ResourceController < ApplicationController

    def index
      if request.headers["token"].present?
        auth_token = request.headers["token"]
      else
        auth_token = nil
      end
      id_follow = params[:follows_methodology_id]
      @user = User.where(authentication_token: auth_token).first
      if @user && FollowsMethodology.where(user_id: @user.id,id: id_follow)
        @resources = Resource.where(follows_methodologies_id: id_follow).select(:id,:item,:available,:acquisition)
        json_response = { :resources => @resources}.to_json
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
        res = Resource.create(follows_methodologies_id: id_follow,item: params[:item],available: params[:available],acquisition: params[:acquisition])
        if res.save
          render json: {"message": "Recurso creado exitosamente","idResource": res.id}, status: :fail
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
        res = Resource.where(follows_methodologies_id: id_follow,id: params[:id]).first
        if res.destroy
          render json: {"message": "Eliminacion de Difucion exitosa"}, status: :fail
        else
          render json: {"message": "Hubo ub error"}, status: :fail
        end
      else
        render json: {"message": "Esto es información privada"}, status: :fail
      end
    end


end
