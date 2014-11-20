require 'rails_helper'

RSpec.describe AudiosController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for(:audio) }

  let(:invalid_attributes) { { collection_id: 3 } }

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in :user, user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AudiosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all audios as @audios' do
      audio = Audio.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:audios)).to eq([audio])
    end
  end

  describe 'GET show' do
    it 'assigns the requested audio as @audio' do
      audio = Audio.create! valid_attributes
      get :show, { id: audio.to_param }, valid_session
      expect(assigns(:audio)).to eq(audio)
    end
  end

  describe 'GET new' do
    it 'assigns a new audio as @audio' do
      get :new, {}, valid_session
      expect(assigns(:audio)).to be_a_new(Audio)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested audio as @audio' do
      audio = Audio.create! valid_attributes
      get :edit, { id: audio.to_param }, valid_session
      expect(assigns(:audio)).to eq(audio)
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested audio' do
      audio = Audio.create! valid_attributes
      expect do
        delete :destroy, { id: audio.to_param }, valid_session
      end.to change(Audio, :count).by(-1)
    end

    it 'redirects to the audios list' do
      audio = Audio.create! valid_attributes
      delete :destroy, { id: audio.to_param }, valid_session
      expect(response).to redirect_to(audios_url)
    end
  end

end
