class BinnacleController < ApplicationController

    def index
      if request.headers["token"].present?
        auth_token = request.headers["token"]
      else
        auth_token = nil
      end
      id_follow = params[:follows_methodology_id]
      @user = User.where(authentication_token: auth_token).first
      if @user && FollowsMethodology.where(user_id: @user.id,id: id_follow)
        @binnacles = Binnacle.where(follows_methodologies_id: id_follow).select(:id,:start_date,:finish_date,:objectives,:observations,:advances,:obstacles,:ideas)
        json_response = { :binnacles => @binnacles}.to_json
        render json: json_response, status: :ok
      else
        render json: {"message": "Esto es información privada"}, status: :fail
      end
    end

    def show
      if request.headers["token"].present?
        auth_token = request.headers["token"]
      else
        auth_token = nil
      end
      id_follow = params[:follows_methodology_id]
      @user = User.where(authentication_token: auth_token).first
      if @user && FollowsMethodology.where(user_id: @user.id,id: id_follow)
        bin = Binnacle.where(follows_methodologies_id: id_follow,id: params[:id]).select(:id,:start_date,:finish_date,:objectives,:observations,:advances,:obstacles,:ideas).first
        if bin
          json_response = { :binnacle => bin}.to_json
          render json: json_response, status: :ok
        else
          render json: {"message": "Hubo ub error"}, status: :fail
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
        bin = Binnacle.create(follows_methodologies_id: id_follow, start_date: params[:start_date],finish_date: params[:finish_date],objectives: params[:objectives],observations: params[:observations],advances: params[:advances],obstacles: params[:obstacles],ideas: params[:ideas])
        if bin.save
          render json: {"message": "Bitacora creada exitosamente","idBinnacle": bin.id}, status: :ok
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
        bin = Binnacle.where(follows_methodologies_id: id_follow,id: params[:id]).first
        if bin.destroy
          render json: {"message": "Bitacora eliminada exitosamente"}, status: :ok
        else
          render json: {"message": "Hubo ub error"}, status: :fail
        end
      else
        render json: {"message": "Esto es información privada"}, status: :fail
      end
    end
end
