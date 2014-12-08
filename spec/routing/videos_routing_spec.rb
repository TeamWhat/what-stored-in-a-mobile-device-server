require 'rails_helper'

RSpec.describe VideosController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/videos').to route_to('videos#index')
    end

    it 'routes to #show' do
      expect(get: '/videos/1').to route_to('videos#show', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/videos/1').to route_to('videos#destroy', id: '1')
    end
  end
end
