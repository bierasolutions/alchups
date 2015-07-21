require 'rails_helper'

RSpec.describe PhotosController, :type => :controller do
  login_admin
  describe "GET 'new'" do
    before(:each) do
      @tank = FactoryGirl.create(:tank)
      get :new, :tank_id => @tank.id
    end
    it "returns http success" do
      expect(response).to be_success
    end
    it "assign a new tank" do
      expect(assigns(:photo)).to be_a_new(Photo)
    end
  end
end
