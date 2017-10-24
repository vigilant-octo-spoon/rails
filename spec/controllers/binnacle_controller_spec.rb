require 'rails_helper'

RSpec.describe BinnacleController, type: :controller do
  it "responds with JSON" do
    expect(response).to be_success
  end
end
