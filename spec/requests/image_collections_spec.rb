require 'rails_helper'

RSpec.describe 'ImageCollections', type: :request do
  describe 'GET /image_collections' do
    it 'works! (now write some real specs)' do
      get image_collections_path
      expect(response).to have_http_status(200)
    end
  end
end
