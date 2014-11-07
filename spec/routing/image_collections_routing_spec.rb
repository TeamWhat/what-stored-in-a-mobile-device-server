require 'rails_helper'

RSpec.describe ImageCollectionsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/image_collections').to route_to('image_collections#index')
    end

    it 'routes to #new' do
      expect(get: '/image_collections/new').to route_to('image_collections#new')
    end

    it 'routes to #show' do
      expect(get: '/image_collections/1').to route_to('image_collections#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/image_collections/1/edit').to route_to('image_collections#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/image_collections').to route_to('image_collections#create')
    end

    it 'routes to #update' do
      expect(put: '/image_collections/1').to route_to('image_collections#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/image_collections/1').to route_to('image_collections#destroy', id: '1')
    end

  end
end
