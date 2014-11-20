require 'rails_helper'

RSpec.describe 'Audios', type: :request do
  describe 'GET /audios' do
    it 'redirects' do
      get audios_path
      expect(response).to have_http_status(302)
    end
  end
end
