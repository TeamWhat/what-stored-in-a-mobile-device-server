require 'rails_helper'

RSpec.describe 'Videos', type: :request do
  describe 'GET /videos' do
    it 'redirects' do
      get videos_path
      expect(response).to have_http_status(302)
    end
  end
end
