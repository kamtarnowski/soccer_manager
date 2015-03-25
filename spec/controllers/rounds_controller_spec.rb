require 'rails_helper'

RSpec.describe RoundsController, type: :controller do

  describe "GET #index" do
    after(:all) { Round.delete_all }
    round = Round.all
    it 'assigns @rounds' do
      FactoryGirl.create(:round)
      get :index
      expect(assigns(:rounds)) == [round]
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end
  end

end
