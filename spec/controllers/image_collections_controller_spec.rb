require 'rails_helper'

RSpec.describe ImageCollectionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ImageCollection. As you add validations to ImageCollection, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:image_collection) }

  let(:invalid_attributes) { { subject_id: 3 } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ImageCollectionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all image_collections as @image_collections' do
      image_collection = ImageCollection.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:image_collections)).to eq([image_collection])
    end
  end

  describe 'GET show' do
    it 'assigns the requested image_collection as @image_collection' do
      image_collection = ImageCollection.create! valid_attributes
      get :show, { id: image_collection.to_param }, valid_session
      expect(assigns(:image_collection)).to eq(image_collection)
    end
  end

  describe 'GET new' do
    it 'assigns a new image_collection as @image_collection' do
      get :new, {}, valid_session
      expect(assigns(:image_collection)).to be_a_new(ImageCollection)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested image_collection as @image_collection' do
      image_collection = ImageCollection.create! valid_attributes
      get :edit, { id: image_collection.to_param }, valid_session
      expect(assigns(:image_collection)).to eq(image_collection)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      let(:valid_attributes) { { subject_id: 3 } }

      it 'creates a new ImageCollection' do
        expect do
          post :create, { image_collection: valid_attributes }, valid_session
        end.to change(ImageCollection, :count).by(1)
      end

      it 'assigns a newly created image_collection as @image_collection' do
        post :create, { image_collection: valid_attributes }, valid_session
        expect(assigns(:image_collection)).to be_a(ImageCollection)
        expect(assigns(:image_collection)).to be_persisted
      end

      it 'redirects to the created image_collection' do
        post :create, { image_collection: valid_attributes }, valid_session
        expect(response).to redirect_to(ImageCollection.last)
      end
    end

    describe 'with invalid params' do
      before :each do
        allow_any_instance_of(ImageCollection).to receive(:save).and_return(false)
      end

      it 'assigns a newly created but unsaved image_collection as @image_collection' do
        post :create, { image_collection: invalid_attributes }, valid_session
        expect(assigns(:image_collection)).to be_a_new(ImageCollection)
      end

      it "re-renders the 'new' template" do
        post :create, { image_collection: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested image_collection' do
      image_collection = ImageCollection.create! valid_attributes
      expect do
        delete :destroy, { id: image_collection.to_param }, valid_session
      end.to change(ImageCollection, :count).by(-1)
    end

    it 'redirects to the image_collections list' do
      image_collection = ImageCollection.create! valid_attributes
      delete :destroy, { id: image_collection.to_param }, valid_session
      expect(response).to redirect_to(image_collections_url)
    end
  end

end
