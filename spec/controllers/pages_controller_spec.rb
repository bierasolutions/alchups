require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "GET 'index'" do
    before(:each) do
      FactoryGirl.create(:tank)
      FactoryGirl.create(:tank)
      FactoryGirl.create(:route)
      FactoryGirl.create(:route)
      get :index
    end
    it "returns http success" do
      expect(response).to be_success
    end

    it "has a list of tanks" do
      expect(assigns(:tanks).size).to be 2
    end

    it "has a list of routes" do
      expect(assigns(:routes).size).to be 2
    end
  end
end
