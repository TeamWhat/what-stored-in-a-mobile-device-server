class VisualizationsController < ApplicationController
  def index
    @visualization_data = {
    brand_count: Subject.group(:brand).count,
    gender_count: Subject.group(:gender).count,
    age_count: Subject.group(:age).count,
    country_count: Subject.group(:country).count,

    average_text_age: Text.average_text_file_age,
    average_image_age: Image.average_image_file_age,
    average_audio_age: Audio.average_audio_file_age,
    average_app_install_age: Application.average_application_install_age,

    minimum_image_age: Image.minimum_image_file_age,
    maximum_image_age: Image.maximum_image_file_age,

    minimum_text_age: Text.minimum_text_file_age,
    maximum_text_age: Text.maximum_text_file_age,

    minimum_audio_age: Audio.minimum_audio_file_age,
    maximum_audio_age: Audio.maximum_audio_file_age,

    minimum_app_install_age: Application.minimum_application_file_age,
    maximum_app_install_age: Application.maximum_application_install_age,

    average_text_size: Text.average_text_file_size,
    average_image_size: Image.average_image_file_size,
    average_audio_size: Audio.average_audio_file_size,

    minimum_image_size: Image.minimum_image_file_size,
    maximum_image_size: Image.maximum_image_file_size,

    minimum_text_size: Text.minimum_text_file_size,
    maximum_text_size: Text.maximum_text_file_size,

    minimum_audio_size: Audio.minimum_audio_file_size,
    maximum_audio_size: Audio.maximum_audio_file_size,
    }
  end
end
