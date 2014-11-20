require 'rails_helper'

RSpec.describe 'Texts', type: :request do
  describe 'GET /texts' do
    it 'should redirect' do
      get texts_path
      expect(response).to have_http_status(302)
    end
  end
end
