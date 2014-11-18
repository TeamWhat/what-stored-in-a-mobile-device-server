require 'rails_helper'

RSpec.describe 'collections', type: :request do
  describe 'GET /collections' do
    it 'redirects' do
      get collections_path
      expect(response).to have_http_status(302)
    end
  end
end
