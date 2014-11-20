require 'rails_helper'

RSpec.describe ReceiveDataController, type: :controller do

  context 'with valid data' do
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
        },
        personal_info: {
          '0' => {
            gender: 'male',
            age: 132,
            country: 'CCCP'
          }
        },
        application_data: {
          '0' => {
            datetime: '1413189832',
            first_installed: '1413189555',
            application_label: 'Browser'
          }
        },
        text_data: {
          '0' => {
            datetime: '1413189832',
            date_added: '1416481941',
            date_modified: '1416481806',
            size: '21',
            mime_type: 'application/pdf'
          }
        }
      }
    end

    context 'that has been sent' do
      before :each do
        post 'receive', data
        @subject = Subject.last
      end

      describe 'subject' do
        it 'has been saved' do
          expect(@subject.uid).to eq(data[:uid])
          expect(@subject.device).to eq(data[:device_info]['0'][:device])
        end
      end

      describe 'images' do
        it 'have been saved' do
          image = @subject.collections.last.images.last
          expect(image.latitude.to_s).to eq(data[:image_info]['0'][:latitude])
        end
      end

      describe 'applications' do
        it 'have been saved' do
          application = @subject.collections.last.applications.last
          expect(application.label).to eq(data[:application_data]['0'][:application_label])
        end
      end

      describe 'text files' do
        it 'have been saved' do
          text = @subject.collections.last.texts.last
          expect(text.size.to_s).to eq(data[:text_data]['0'][:size])
        end
      end
    end

    describe 'latter submission' do
      it "doesn't create a new subject" do
        post 'receive', data
        post 'receive', data
        expect(Subject.count).to eq(1)
      end
    end
  end
end
