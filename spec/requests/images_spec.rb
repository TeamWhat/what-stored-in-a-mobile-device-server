require 'rails_helper'

RSpec.describe 'Images', type: :request do
  describe 'GET /images' do
    it 'redirects' do
      get images_path
      expect(response).to have_http_status(302)
    end
  end
end
