require 'rails_helper'

RSpec.describe ApplicationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Application. As you add validations to Application, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:application) }

  let(:invalid_attributes) { { collection_id: 3 } }

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in :user, user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ApplicationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all applications as @applications' do
      application = Application.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:applications)).to eq([application])
    end
  end

  describe 'GET show' do
    it 'assigns the requested application as @application' do
      application = Application.create! valid_attributes
      get :show, { id: application.to_param }, valid_session
      expect(assigns(:application)).to eq(application)
    end
  end

  describe 'GET new' do
    it 'assigns a new application as @application' do
      get :new, {}, valid_session
      expect(assigns(:application)).to be_a_new(Application)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested application as @application' do
      application = Application.create! valid_attributes
      get :edit, { id: application.to_param }, valid_session
      expect(assigns(:application)).to eq(application)
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested application' do
      application = Application.create! valid_attributes
      expect do
        delete :destroy, { id: application.to_param }, valid_session
      end.to change(Application, :count).by(-1)
    end

    it 'redirects to the applications list' do
      application = Application.create! valid_attributes
      delete :destroy, { id: application.to_param }, valid_session
      expect(response).to redirect_to(applications_url)
    end
  end

end
