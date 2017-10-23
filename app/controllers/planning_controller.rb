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


  def show

  end
  def create

  end

end
