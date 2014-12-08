require 'rails_helper'

RSpec.describe SubjectsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Subject. As you add validations to Subject, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:subject) }

  let(:invalid_attributes) { { subject: {} } }

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in :user, user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SubjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all subjects as @subjects' do
      subject = Subject.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:subjects)).to eq([subject])
    end
  end

  describe 'GET show' do
    it 'assigns the requested subject as @subject' do
      subject = Subject.create! valid_attributes
      get :show, { id: subject.to_param }, valid_session
      expect(assigns(:subject)).to eq(subject)
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested subject' do
      subject = Subject.create! valid_attributes
      expect do
        delete :destroy, { id: subject.to_param }, valid_session
      end.to change(Subject, :count).by(-1)
    end

    it 'redirects to the subjects list' do
      subject = Subject.create! valid_attributes
      delete :destroy, { id: subject.to_param }, valid_session
      expect(response).to redirect_to(subjects_url)
    end
  end

end
