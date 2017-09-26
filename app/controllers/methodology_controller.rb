class MethodologyController < ApplicationController

  def index
    # Example
    @methodologies = Methodology.all
    json_response(@methodologies)
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

end
