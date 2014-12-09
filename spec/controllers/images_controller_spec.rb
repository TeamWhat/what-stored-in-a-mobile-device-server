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
