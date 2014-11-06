require 'rails_helper'

RSpec.describe 'Subjects', type: :request do
  describe 'GET /subjects' do
    it 'works' do
      get subjects_path
      expect(response).to have_http_status(200)
    end
  end
end
