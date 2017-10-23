class ReportController < ApplicationController

    def index
      if request.headers["token"].present?
        auth_token = request.headers["token"]
      else
        auth_token = nil
      end
      id_follow = params[:follows_methodology_id]
      @user = User.where(authentication_token: auth_token).first
      if @user && FollowsMethodology.where(user_id: @user.id,id: id_follow)
        rep = Report.where(follows_methodologies_id: id_follow).select(:id,:comment).first
        if rep
          json_response = { :report => rep}.to_json
          render json: json_response, status: :ok
        else
          render json: {"message": "Hubo un error"}, status: :fail
        end
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
        if Report.where(follows_methodologies_id: id_follow).first
          render json: {"message": "Ya tienes un Reporte hecho"}, status: :fail
        else
          rep = Report.create(follows_methodologies_id: id_follow,comment: params[:comment])
          if rep.save
            render json: {"message": "Reporte exitoso","idReport": rep.id}, status: :ok
          else
            render json: {"message": "Hubo ub error"}, status: :fail
          end
        end
      else
        render json: {"message": "Esto es información privada, usuario no encontrado"}, status: :fail
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
        rep =  Report.where(follows_methodologies_id: id_follow,id: params[:id]).first
        if rep.destroy
          render json:  {"message": "Eliminacion exitosa"}, status: :ok
        else
          render json: {"message": "No puso ser eliminado, intente mas tarde" }, status: :fail
        end
      else
        render json: {"message": "Esto es información privada"}, status: :fail
      end


    end

  end
