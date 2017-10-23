class EvaluationController < ApplicationController

  def index
    if request.headers["token"].present?
      auth_token = request.headers["token"]
    else
      auth_token = nil
    end
    id_follow = params[:follows_methodology_id]
    @user = User.where(authentication_token: auth_token).first
    if @user && FollowsMethodology.where(user_id: @user.id,id: id_follow)
      eva = Evaluation.where(follows_methodologies_id: id_follow).select(:id,:comments_connect,:comments_select,:comments_planning,:comments_implementation,:users_reflection,:users_suggestions).first
      if eva
        json_response = { :evaluation => eva}.to_json
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
      if Evaluation.where(follows_methodologies_id: id_follow).first
        render json: {"message": "Ya tienes una Evaluacion hecha"}, status: :fail
      else
        eva = Evaluation.create(follows_methodologies_id: id_follow,comments_connect: params[:comments_connect],comments_select: params[:comments_select],comments_planning: params[:comments_planning],comments_implementation: params[:comments_implementation],users_reflection: params[:users_reflection],users_suggestions: params[:users_suggestions])
        if eva.save
          render json: {"message": "Evaluacion exitosa","idEvaluation": eva.id}, status: :ok
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
      eva =  Evaluation.where(follows_methodologies_id: id_follow,id: params[:id]).first
      if eva.destroy
        render json:  {"message": "Eliminacion exitosa"}, status: :ok
      else
        render json: {"message": "No puso ser eliminado, intente mas tarde" }, status: :fail
      end
    else
      render json: {"message": "Esto es información privada"}, status: :fail
    end


  end

end
