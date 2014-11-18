require 'rails_helper'

RSpec.describe CollectionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Collection. As you add validations to Collection, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:collection) }

  let(:invalid_attributes) { { subject_id: 3 } }

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in :user, user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CollectionsController. Be sure to keep this updated too.
  let(:valid_session) {}

  describe 'GET index' do
    it 'assigns all collections as @collections' do
      collection = Collection.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:collections)).to eq([collection])
    end
  end

  describe 'GET show' do
    it 'assigns the requested collection as @collection' do
      collection = Collection.create! valid_attributes
      get :show, { id: collection.to_param }, valid_session
      expect(assigns(:collection)).to eq(collection)
    end
  end

  describe 'GET new' do
    it 'assigns a new collection as @collection' do
      get :new, {}, valid_session
      expect(assigns(:collection)).to be_a_new(Collection)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested collection as @collection' do
      collection = Collection.create! valid_attributes
      get :edit, { id: collection.to_param }, valid_session
      expect(assigns(:collection)).to eq(collection)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      let(:valid_attributes) { { subject_id: 3 } }

      it 'creates a new Collection' do
        expect do
          post :create, { collection: valid_attributes }, valid_session
        end.to change(Collection, :count).by(1)
      end

      it 'assigns a newly created collection as @collection' do
        post :create, { collection: valid_attributes }, valid_session
        expect(assigns(:collection)).to be_a(Collection)
        expect(assigns(:collection)).to be_persisted
      end

      it 'redirects to the created collection' do
        post :create, { collection: valid_attributes }, valid_session
        expect(response).to redirect_to(Collection.last)
      end
    end

    describe 'with invalid params' do
      before :each do
        allow_any_instance_of(Collection).to receive(:save).and_return(false)
      end

      it 'assigns a newly created but unsaved collection as @collection' do
        post :create, { collection: invalid_attributes }, valid_session
        expect(assigns(:collection)).to be_a_new(Collection)
      end

      it "re-renders the 'new' template" do
        post :create, { collection: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested collection' do
      collection = Collection.create! valid_attributes
      expect do
        delete :destroy, { id: collection.to_param }, valid_session
      end.to change(Collection, :count).by(-1)
    end

    it 'redirects to the collections list' do
      collection = Collection.create! valid_attributes
      delete :destroy, { id: collection.to_param }, valid_session
      expect(response).to redirect_to(collections_url)
    end
  end

end
