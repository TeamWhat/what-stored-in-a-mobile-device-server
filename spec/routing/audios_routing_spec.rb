require 'rails_helper'

RSpec.describe AudiosController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/audios').to route_to('audios#index')
    end

    it 'routes to #show' do
      expect(get: '/audios/1').to route_to('audios#show', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/audios/1').to route_to('audios#destroy', id: '1')
    end

  end
end
