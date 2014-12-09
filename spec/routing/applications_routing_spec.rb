require 'rails_helper'

RSpec.describe ApplicationsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/applications').to route_to('applications#index')
    end

    it 'routes to #show' do
      expect(get: '/applications/1').to route_to('applications#show', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/applications/1').to route_to('applications#destroy', id: '1')
    end

  end
end
