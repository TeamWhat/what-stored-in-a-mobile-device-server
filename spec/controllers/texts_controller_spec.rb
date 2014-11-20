require 'rails_helper'

RSpec.describe TextsController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for(:text) }

  let(:invalid_attributes) { { collection_id: 3 } }

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in :user, user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TextsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all texts as @texts' do
      text = Text.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:texts)).to eq([text])
    end
  end

  describe 'GET show' do
    it 'assigns the requested text as @text' do
      text = Text.create! valid_attributes
      get :show, { id: text.to_param }, valid_session
      expect(assigns(:text)).to eq(text)
    end
  end

  describe 'GET new' do
    it 'assigns a new text as @text' do
      get :new, {}, valid_session
      expect(assigns(:text)).to be_a_new(Text)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested text as @text' do
      text = Text.create! valid_attributes
      get :edit, { id: text.to_param }, valid_session
      expect(assigns(:text)).to eq(text)
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested text' do
      text = Text.create! valid_attributes
      expect do
        delete :destroy, { id: text.to_param }, valid_session
      end.to change(Text, :count).by(-1)
    end

    it 'redirects to the texts list' do
      text = Text.create! valid_attributes
      delete :destroy, { id: text.to_param }, valid_session
      expect(response).to redirect_to(texts_url)
    end
  end

end
