require 'rails_helper'

RSpec.describe SeasonsController, type: :controller do

  let!(:season) { FactoryGirl.create(:season, id: 1) }
  after(:all) { Season.delete_all }

  describe("POST #update") {
    after(:each) do
      MatchResult.delete_all
      Team.delete_all
    end

    context 'without sufficient amount of teams' do
      let!(:team) { FactoryGirl.create(:team) }
      it('should bring the error') {
        post :update, season: FactoryGirl.attributes_for(:season, status: 'active')
        expect(response).to redirect_to '/teams'
        expect(flash[:notice]) == (/^Brak wystarczającej liczby Drużyn, bądź liczba ich jest nieparzysta./)
      }
    end

    context('valid amounts of teams') {
      it('should change season to active status') {
        4.times { FactoryGirl.create(:team) }
        post :update, season: FactoryGirl.attributes_for(:season, status: 'active', id: 1)
        expect(response).to redirect_to '/rounds/index'
        expect(flash[:notice]) == (/^Sezon został rozpoczęty./)
      }
    }
  }

  describe 'GET #index' do
    after(:all) do
      Team.delete_all
      Round.delete_all
    end
    let!(:team) { FactoryGirl.create(:team) }
    let!(:round) { FactoryGirl.create(:round) }
    it 'assigns @teams & @rounds' do
      get :index
      expect(assigns(:teams)) == [team]
      expect(assigns(:rounds)) == [round]
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe('GET #new') {
    it('deletes whole database') {
      expect(MatchResult.count) == 0
      expect(Team.count) == 0
      expect(Match.count) == 0
      expect(Round.count) == 0
      expect(flash[:notice]) == (/^Przed Sezonem./)
    }
  }

  describe 'GET #index_classification' do
    after(:all) { Team.delete_all }
    let!(:team) { FactoryGirl.create(:team) }
    it 'assigns @teams' do
      get :index
      expect(assigns(:teams)) == [team]
    end

    it 'renders the index template' do
      get :index_classification
      expect(response).to render_template :index_classification
    end
  end
end
