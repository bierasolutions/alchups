require 'rails_helper'

RSpec.describe TanksController, :type => :controller do
  def valid_attributes
    tank = FactoryGirl.build(:tank)
    {title: tank.title}
  end

  def invalid_attributes
    {title: ''}
  end

  describe "GET 'new'" do
    before(:each) do
      get :new
    end
    it "returns http success" do
      expect(response).to be_success
    end
    it "assign a new tank" do
      expect(assigns(:tank)).to be_a_new(Tank)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Tank" do
        expect {
          post :create, :tank => valid_attributes
        }.to change(Tank, :count).by(1)
      end

     it "redirects to tank page" do
       post :create, :tank => valid_attributes
       expect(response).to redirect_to(tank_path(Tank.last))
     end
    end
    describe "with invalid params" do
      before(:each) do
        post :create, :tank => invalid_attributes
      end
      it "renders the new form" do
        expect(response).to render_template(:new)
      end
      it "the tank has validation errors" do
        expect(assigns(:tank).errors.any?).to be true
      end
    end
  end

  describe "GET 'index'" do
    before(:each) do
      get :index
    end
    it "returns http success" do
      expect(response).to be_success
    end
    
  end
end
