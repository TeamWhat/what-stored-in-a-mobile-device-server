require 'rails_helper'

RSpec.describe SubjectsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/subjects').to route_to('subjects#index')
    end

    it 'routes to #show' do
      expect(get: '/subjects/1').to route_to('subjects#show', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/subjects/1').to route_to('subjects#destroy', id: '1')
    end

  end
end
