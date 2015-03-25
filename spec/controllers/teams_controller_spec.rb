require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let!(:season) { FactoryGirl.create(:season, id: 1, status: 'inactive') }

  after(:all) { Season.delete_all; Team.delete_all }
  describe 'GET #index' do
    after(:all) { Team.delete_all }
    let!(:team) { FactoryGirl.create(:team) }
    it 'assigns @teams' do
      get :index
      expect(assigns(:teams)) == [team]
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    after(:each) { Team.delete_all }
    context 'with invalid form' do
      let!(:team) { FactoryGirl.attributes_for(:team, name: '') }
      it 'renders the page with error' do
        post :create, team: team
        expect(response).to render_template :new
        expect(flash[:notice]) == (/^Nie dodano Drużyny./)
      end
    end

    context 'with valid form' do
      let!(:team) { FactoryGirl.attributes_for(:team) }
      it 'creates new Team and redirects :back' do
        post :create, team: team
        expect(response).to redirect_to '/teams'
        expect(flash[:notice]) == (/^Dodano Drużynę./)
      end
    end
  end

  describe 'PATCH #update' do
    after(:each) { Team.delete_all }
    context 'with invalid form' do
      let!(:team) { FactoryGirl.create(:team, id: 5) }
      it 'renders the page with error' do
        # @team = Team.find(5)
        patch :update, id: 5, team: { name: '-' }
        expect(response).to render_template :edit
        expect(flash[:notice]) == (/^Nie zaktualizowano Drużyny./)
      end
    end

    context 'with valid form' do
      let!(:team) { FactoryGirl.create(:team, id: 5) }
      it 'updates successfully and redirects to teams_path' do
        patch :update, id: 5, team: { name: 'Valid Name' }
        expect(response).to redirect_to '/'
        expect(flash[:notice]) == (/^Zaktualizowano Drużynę./)
      end
    end
  end
end
