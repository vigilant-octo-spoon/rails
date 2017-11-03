class FollowsMethodologyController < ApplicationController

  def index
    if request.headers["token"].present?
      auth_token = request.headers["token"]
    else
      auth_token = nil
    end
    @user = User.where(authentication_token: auth_token).first

    if @user
      folow_met = FollowsMethodology.where(user_id: @user.id)
      follows = []
      folow_met.each do |fll|
        #### INFO F #####
        methodology_name = Methodology.find_by_id(fll.methodology_id).title
        #### STEP 3 #####
        @planning = Planning.where(follows_methodologies_id: fll.id).select(:id,:initiative_name,:objective,:place,:start_date,:finish_date).first
        @work_roles = WorkRole.where(follows_methodologies_id: fll.id).select(:id,:name,:role)
        @broadcasts = Broadcast.where(follows_methodologies_id: fll.id).select(:id,:moment_of_implementation,:audience,:diffusion_channel,:objective)
        @conditions = Condition.where(follows_methodologies_id: fll.id).select(:id,:item,:info)
        @resources = Resource.where(follows_methodologies_id: fll.id).select(:id,:item,:available,:acquisition)
        json_step3 = { :planning => @planning, :work_roles => @work_roles, :broadcasts => @broadcasts, :conditions => @conditions, :resources => @resources}
        #### STEP 4 #####
        @binnacles = Binnacle.where(follows_methodologies_id: fll.id).select(:id,:start_date,:finish_date,:objectives,:observations,:advances,:obstacles,:ideas)
        json_step4 = { :binnacles => @binnacles}
        #### STEP 5 #####
        eva = Evaluation.where(follows_methodologies_id: fll.id).select(:id,:comments_connect,:comments_select,:comments_planning,:comments_implementation,:users_reflection,:users_suggestions).first
        json_step5 = { :evaluation => eva}
        #### STEP 6 #####
        rep = Report.where(follows_methodologies_id: fll.id).select(:id,:comment).first
        json_step6 = { :report => rep}

        json_follow= { :id => fll.id, :name => methodology_name, :step => fll.step, :step3 => json_step3, :step4 => json_step4, :step5 => json_step5, :step6 => json_step6 }
        follows.push(json_follow)
      end
      json_final = { :follows => follows}.to_json
      render json: json_final, status: :ok
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
        render json: folow_met, status: :ok
      else
        render json: {"message": "Esto es información privada"}, status: :fail
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
    @user = User.where(authentication_token: auth_token).first
    if @user
      folow_met= FollowsMethodology.create(user_id: params[:user],methodology_id: params[:methodology])
      if folow_met.save
        render json: {"message": "Seguimiento con exito","idFolow": folow_met.id }, status: :fail
      else
        render json: {"message": "Esto es información privada"}, status: :fail
      end
    else
      render json: {"message": "Esto es información privada, usuario no encontrado"}, status: :fail
    end
  end

end
