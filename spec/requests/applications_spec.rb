require 'rails_helper'

RSpec.describe 'Applications', type: :request do
  describe 'GET /applications' do
    it 'redirects' do
      get applications_path
      expect(response).to have_http_status(302)
    end
  end
end
