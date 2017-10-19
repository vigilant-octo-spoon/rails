class MethodologyController < ApplicationController

  def index
    # Example
    @methodologies = Methodology.all
    #json_response(@methodologies)
    render json: @methodologies, status: :ok
  end

  def create
    @methodologies = Methodology.new(methodology_params)
    @methodologies.save
    render json: @methodologies, status: :created
  end

  def show
  end

  def update
  end

  def destroy
      @methodologies = Methodology.where(id: params(:id)).first
      if @methodologies.destroy
        head(:ok)
      else
        head(:fail)
      end
  end

  private

  def methodology_params
    params.require(:methodology_params).permit(:title, :description, :user_id, :team_id )
  end

end
