require 'rails_helper'

RSpec.describe TextsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/texts').to route_to('texts#index')
    end

    it 'routes to #show' do
      expect(get: '/texts/1').to route_to('texts#show', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/texts/1').to route_to('texts#destroy', id: '1')
    end

  end
end
