require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Image. As you add validations to Image, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:image) }

  let(:invalid_attributes) { { collection_id: 3 } }

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in :user, user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ImagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all images as @images' do
      image = Image.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:images)).to eq([image])
    end
  end

  describe 'GET show' do
    it 'assigns the requested image as @image' do
      image = Image.create! valid_attributes
      get :show, { id: image.to_param }, valid_session
      expect(assigns(:image)).to eq(image)
    end
  end

  describe 'GET new' do
    it 'assigns a new image as @image' do
      get :new, {}, valid_session
      expect(assigns(:image)).to be_a_new(Image)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested image as @image' do
      image = Image.create! valid_attributes
      get :edit, { id: image.to_param }, valid_session
      expect(assigns(:image)).to eq(image)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      let(:valid_attributes) { { collection_id: 3 } }

      it 'creates a new Image' do
        expect do
          post :create, { image: valid_attributes }, valid_session
        end.to change(Image, :count).by(1)
      end

      it 'assigns a newly created image as @image' do
        post :create, { image: valid_attributes }, valid_session
        expect(assigns(:image)).to be_a(Image)
        expect(assigns(:image)).to be_persisted
      end

      it 'redirects to the created image' do
        post :create, { image: valid_attributes }, valid_session
        expect(response).to redirect_to(Image.last)
      end
    end

    describe 'with invalid params' do
      before :each do
        allow_any_instance_of(Image).to receive(:save).and_return(false)
      end

      it 'assigns a newly created but unsaved image as @image' do
        post :create, { image: invalid_attributes }, valid_session
        expect(assigns(:image)).to be_a_new(Image)
      end

      it "re-renders the 'new' template" do
        post :create, { image: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested image' do
      image = Image.create! valid_attributes
      expect do
        delete :destroy, { id: image.to_param }, valid_session
      end.to change(Image, :count).by(-1)
    end

    it 'redirects to the images list' do
      image = Image.create! valid_attributes
      delete :destroy, { id: image.to_param }, valid_session
      expect(response).to redirect_to(images_url)
    end
  end

end
