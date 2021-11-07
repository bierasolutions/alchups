require 'rails_helper'

RSpec.describe QrController, :type => :controller do
  describe "GET 'show'" do
    it 'redirects to a target_url if exists' do
      @redirection = FactoryBot.create(:redirection)
      get :show, :id => @redirection.id
      expect(response).to redirect_to(@redirection.target_url)
    end

  end
end
