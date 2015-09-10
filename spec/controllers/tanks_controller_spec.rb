require 'rails_helper'

RSpec.describe TanksController, :type => :controller do
  def valid_attributes
    tank = FactoryGirl.build(:tank)
    {title: tank.title}
  end

  def invalid_attributes
    {title: ''}
  end

  login_admin

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

  describe "GET 'show'" do
    render_views
    
    before(:each) do
      @tank = FactoryGirl.create(:tank)
      get :show, {:id => @tank.id}
    end

    it "returns http success" do
      expect(response).to be_success
    end

    it "contains tank title" do
      expect(response.body).to include(@tank.title)
    end
  end

  describe "GET 'edit'" do
    
    before(:each) do
      @tank = FactoryGirl.create(:tank)
      get :edit, {:id => @tank.id}
    end

    it "returns http success" do
      expect(response).to be_success
    end
  end

  describe "PUT update" do
   
    before(:each) do
      @tank = FactoryGirl.create(:tank)
    end

    describe "with valid params" do
      before(:each) do
        put :update, :id => @tank.id,:tank => {:title => 'Nuevo Alchup', :description => 'Nueva descripcion', :y => 0, :x => 0, :notes => 'Nueva nota'}
      end
      it "changes tank attributes" do
        @tank.reload
        expect(@tank.title).to eq("Nuevo Alchup")
        expect(@tank.description).to eq("Nueva descripcion")
        expect(@tank.y).to eq(0)
        expect(@tank.x).to eq(0)
        expect(@tank.notes).to eq("Nueva nota")
      end

      it "redirects to updated tank page" do
        expect(response).to redirect_to(@tank)
      end
    end

    describe "with invalid params" do
      before(:each) do
        put :update,  :id => @tank.id,:tank => {:title => ''}
      end
      it "renders the edit form" do
        expect(response).to render_template(:edit)
      end
      it "the tank has validation errors" do
        expect(assigns(:tank).errors.any?).to be true
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @tank = FactoryGirl.create(:tank)
    end

    it "deletes the Tank" do
        expect {
          delete :destroy, :id => @tank.id
        }.to change(Tank, :count).by(-1)
    end

    it "redirects to index page" do
      delete :destroy, :id => @tank.id
      expect(response).to redirect_to(tanks_url)
    end
  end

  describe "GET order_by_id" do
    before(:each) do
      @tank1 = Tank.create(title: "b_title")
      @tank2 = Tank.create(title: "a_title")
      get :order_by_id
    end

    it "shows tanks ordered by id" do
        expect(assigns(:tanks)).to eq([@tank1, @tank2])
    end

    it "renders index page" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET order_by_title" do
    before(:each) do
      @tank1 = Tank.create(title: "b_title")
      @tank2 = Tank.create(title: "a_title")
      get :order_by_title
    end

    it "shows tanks ordered by title" do
        expect(assigns(:tanks)).to eq([@tank2, @tank1])
    end

    it "renders index page" do
      expect(response).to render_template(:index)
    end
  end


end
