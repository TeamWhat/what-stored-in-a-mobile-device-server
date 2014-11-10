require 'rails_helper'

RSpec.describe 'ImageCollections', type: :request do
  describe 'GET /image_collections' do
    it 'redirects' do
      get image_collections_path
      expect(response).to have_http_status(302)
    end
  end
end
