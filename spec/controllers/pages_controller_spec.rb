require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "GET 'index'" do
    before(:each) do
      FactoryBot.create(:tank)
      FactoryBot.create(:tank)
      FactoryBot.create(:route)
      FactoryBot.create(:route)
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

  describe "GET 'alchup'" do
    let(:tank) {FactoryBot.create(:tank)}
    before(:each) do
      get :alchup, {:id => tank.id}
    end
    it "returns http success" do
      expect(response).to be_success
    end

    it "has a a tank" do
      expect(assigns(:tank).id).to be tank.id
    end
  end
end
