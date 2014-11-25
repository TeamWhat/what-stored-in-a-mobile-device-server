require 'rails_helper'

RSpec.describe ReceiveDataController, type: :controller do

  context 'with valid data' do
    let(:email) { 'example@example.com' }
    let(:version) { '2.0' }
    let(:data) do
      {
        uid: "�g�i._i��;�b\\a0005'p87k�k��KGP�HA���",
        image_data: {
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
            datetime: '1413189832',
            version: version
          }
        },
        personal_info: {
          gender: 'male',
          age: 132,
          country: 'CCCP',
          email: email
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
        },
        audio_data: {
          '0' => {
            datetime: '1413189832',
            artist: 'Tester',
            year: '1776',
            date_added: '1416491308',
            date_modified: '1416491308',
            is_notification: '0',
            is_podcast: '0',
            is_music: '0',
            is_ringtone: '0',
            is_alarm: '0',
            duration: '0',
            composer: '0',
            size: '56',
            album: 'test music'
          }
        },
        video_data: {
          '0' => {
            tags: 'music video',
            album: 'test videos',
            resolution: '800x600',
            size: '2555',
            category: 'test category',
            duration: '55',
            date_added: '1416491308',
            date_modified: '1416491308',
            date_taken: '1416491308',
            description: 'test description',
            is_private: 'false',
            longitude: '60.2',
            latitude: '55.8',
            artist: 'tester',
            language: 'english',
            datetime: '1413189832'
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
          expect(image.latitude.to_s).to eq(data[:image_data]['0'][:latitude])
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

      describe 'audio files' do
        it 'have been saved' do
          audio = @subject.collections.last.audios.last
          expect(audio.size.to_s).to eq(data[:audio_data]['0'][:size])
        end
      end

      describe 'video files' do
        it 'have been saved' do
          video = @subject.collections.last.videos.last
          expect(video.size.to_s).to eq(data[:video_data]['0'][:size])
        end
      end

      describe 'email' do
        it 'has been saved' do
          expect(Email.last.email).to eq(data[:personal_info][:email])
        end
      end
    end

    context 'after submission' do
      before :each do
        post 'receive', data
      end

      describe 'another submission' do
        before :each do
          post 'receive', data
        end

        it "doesn't create a new subject" do
          expect(Subject.count).to eq(1)
        end

        it "doesn't save email again" do
          expect(Email.count).to eq(1)
        end

        describe 'with different email' do
          let(:email) { 'you@you.fi' }

          it "doesn't create a new email" do
            post 'receive', data
            expect(Email.count).to eq(1)
          end
        end

        describe 'with different version' do
          let(:version) { '4.2' }

          it 'updates the database' do
            expect(Subject.last.version).to eq('4.2')
          end
        end
      end

    end
  end
end
