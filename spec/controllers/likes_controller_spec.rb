require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe 'POST create' do
    let(:valid_post_params) { { like: { liked_item_id: 1, liked_item_type: 'olio_item' } } }
    let(:invalid_post_params) { { like: { liked_item_id: 1, liked_item_type: 'other_item' } } }

    context 'with valid attributes' do
      it 'creates a new like' do
        expect{
          post :create, params: valid_post_params
        }.to change(Like, :count).by(1)
      end

      it 'redirects to the olio_items_path' do
        post :create, params: valid_post_params
        expect(response).to redirect_to(olio_items_path)
        expect(flash[:success]).to match(/You successfully liked a product/)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new like' do
        expect{
          post :create, params: invalid_post_params
        }.to change(Like, :count).by(0)
      end

      it 'redirects to the olio_items_path' do
        post :create, params: invalid_post_params
        expect(response).to redirect_to(olio_items_path)
        expect(flash[:notice]).to match(/We could not record your like*/)
      end
    end
  end
end
