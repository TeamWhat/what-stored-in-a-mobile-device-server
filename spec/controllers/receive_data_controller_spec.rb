require 'rails_helper'
require 'byebug'

RSpec.describe ReceiveDataController, type: :controller do

  describe 'with valid data' do
    let(:data) do
      {
        uid: "�g�i._i��;�b\\a0005'p87k�k��KGP�HA���",
        image_info: {
          '0' => {
            is_private: 'null',
            longitude: '60.2',
            latitude: '24.5',
            date_added: '1413189832',
            date_modified: '1413189832',
            date_taken: '1413189832',
            size: '25',
            datetime: '1413189832'
          }
        },
        device_info: {
          '0' => {
            device: 'nexus',
            product: '15',
            brand: 'Google',
            model: 'asd',
            serial: 'x6382f11c7ee04a',
            datetime: '1413189832'
          }
        }
      }
    end

    it 'saves the data correctly' do
      post 'receive', data
      subject = Subject.last
      expect(subject.uid).to eq(data[:uid])
      expect(subject.device).to eq(data[:device_info]['0'][:device])
      image = subject.collections.last.images.last
      expect(image.latitude.to_s).to eq(data[:image_info]['0'][:latitude])
    end

    describe 'latter submission' do
      it "doesn't create new subject" do
        post 'receive', data
        post 'receive', data
        expect(Subject.count).to eq(1)
      end

    end
  end
end
