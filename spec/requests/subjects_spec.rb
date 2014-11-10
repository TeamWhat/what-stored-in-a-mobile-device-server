require 'rails_helper'

RSpec.describe 'Subjects', type: :request do
  describe 'GET /subjects' do
    it 'redirects' do
      get subjects_path
      expect(response).to have_http_status(302)
    end
  end
end
