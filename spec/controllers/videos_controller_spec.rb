require 'rails_helper'

RSpec.describe VideosController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for(:video) }

  let(:invalid_attributes) { { collection_id: 3 } }

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in :user, user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VideosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all videos as @videos' do
      video = Video.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:videos)).to eq([video])
    end
  end

  describe 'GET show' do
    it 'assigns the requested video as @video' do
      video = Video.create! valid_attributes
      get :show, { id: video.to_param }, valid_session
      expect(assigns(:video)).to eq(video)
    end
  end

  describe 'GET new' do
    it 'assigns a new video as @video' do
      get :new, {}, valid_session
      expect(assigns(:video)).to be_a_new(Video)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested video as @video' do
      video = Video.create! valid_attributes
      get :edit, { id: video.to_param }, valid_session
      expect(assigns(:video)).to eq(video)
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested video' do
      video = Video.create! valid_attributes
      expect do
        delete :destroy, { id: video.to_param }, valid_session
      end.to change(Video, :count).by(-1)
    end

    it 'redirects to the videos list' do
      video = Video.create! valid_attributes
      delete :destroy, { id: video.to_param }, valid_session
      expect(response).to redirect_to(videos_url)
    end
  end

end
