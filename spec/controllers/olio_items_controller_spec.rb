require 'rails_helper'

RSpec.describe OlioItemsController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @olio_items' do
      get :index
      expect(assigns(:olio_items).count).to be > 0
    end

    it 'should return @olio_items as an array' do
      get :index
      expect(assigns(:olio_items).is_a?(Array)).to be true
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end