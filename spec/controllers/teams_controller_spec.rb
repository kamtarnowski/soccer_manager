require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "Post :create" do
    after(:each) { Team.delete_all }

    context "when team form is valid" do
      team = create(:team)
      post :create, team: team

      expect(response).to redirect_to teams_path
      expect(flash[:notice].to match(/\ADodano Drużynę\z/))
    end
    context 'when team form is invalid' do
      team = create(:team, name: 'Tm')
      post :create, team: team

      expect(response).to render_template(:new)
      expect(flash[:notice].to match(/\ANie dodano Drużyny\z/))
    end
  end
end
