class PlanningController < ApplicationController

  def show_follow
    if request.headers["token"].present?
      auth_token = request.headers["token"]
    else
      auth_token = nil
    end
    id_follow = params[:follows_methodology_id]
    @user = User.where(authentication_token: auth_token).first
    if @user && FollowsMethodology.where(user_id: @user.id,id: id_follow)
      @planning = Planning.where(follows_methodologies_id: id_follow).select(:id,:initiative_name,:objective,:place,:start_date,:finish_date).first
      @work_roles = WorkRole.where(follows_methodologies_id: id_follow).select(:id,:name,:role)
      @broadcasts = Broadcast.where(follows_methodologies_id: id_follow).select(:id,:moment_of_implementation,:audience,:diffusion_channel,:objective)
      @conditions = Condition.where(follows_methodologies_id: id_follow).select(:id,:item,:info)
      @resources = Resource.where(follows_methodologies_id: id_follow).select(:id,:item,:available,:acquisition)
      json_response = { :planning => @planning, :work_roles => @work_roles, :broadcasts => @broadcasts, :conditions => @conditions, :resources => @resources}.to_json

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
      pls =  Planning.where(follows_methodologies_id: id_follow).first
      Rails.logger.debug("My object: #{pls.inspect}")
      if Planning.where(follows_methodologies_id: id_follow).first
        render json: {"message": "Ya tienes esta parte de la planificacion hecha"}, status: :fail
      else
        plan = Planning.create(follows_methodologies_id: id_follow,initiative_name: params[:initiative_name],objective: params[:objective],place: params[:place],start_date: params[:start_date],finish_date: params[:finish_date])
        if plan.save
          render json: {"message": "Planificacion exitosa","idPlanning": plan.id}, status: :ok
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
      plan =  Planning.where(follows_methodologies_id: id_follow,id: params[:id]).first
      if plan.destroy
        render json:  {"message": "Eliminacion exitosa"}, status: :ok
      else
        render json: {"message": "No puso ser eliminado, intente mas tarde" }, status: :fail
      end
    else
      render json: {"message": "Esto es información privada"}, status: :fail
    end


  end

end
