require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ImageCollectionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ImageCollection. As you add validations to ImageCollection, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

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

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested image_collection' do
        image_collection = ImageCollection.create! valid_attributes
        put :update, { id: image_collection.to_param, image_collection: new_attributes }, valid_session
        image_collection.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested image_collection as @image_collection' do
        image_collection = ImageCollection.create! valid_attributes
        put :update, { id: image_collection.to_param, image_collection: valid_attributes }, valid_session
        expect(assigns(:image_collection)).to eq(image_collection)
      end

      it 'redirects to the image_collection' do
        image_collection = ImageCollection.create! valid_attributes
        put :update, { id: image_collection.to_param, image_collection: valid_attributes }, valid_session
        expect(response).to redirect_to(image_collection)
      end
    end

    describe 'with invalid params' do
      it 'assigns the image_collection as @image_collection' do
        image_collection = ImageCollection.create! valid_attributes
        put :update, { id: image_collection.to_param, image_collection: invalid_attributes }, valid_session
        expect(assigns(:image_collection)).to eq(image_collection)
      end

      it "re-renders the 'edit' template" do
        image_collection = ImageCollection.create! valid_attributes
        put :update, { id: image_collection.to_param, image_collection: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
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
