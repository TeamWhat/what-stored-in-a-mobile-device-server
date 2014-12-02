class VisualizationsController < ApplicationController
  def index
    @visualization_data = {
      brand_count: Subject.group(:brand).count,
      gender_count: Subject.group(:gender).count,
      age_count: Subject.group(:age).count,
      country_count: Subject.group(:country).count,
      os_version_count: Subject.group(:version).count,

      average_text_age: Text.average_age,
      average_image_age: Image.average_age,
      average_audio_age: Audio.average_age,
      average_app_install_age: Application.average_application_install_age,
      average_video_age: Video.average_age,

      minimum_image_age: Image.minimum_age,
      maximum_image_age: Image.maximum_age,

      minimum_text_age: Text.minimum_age,
      maximum_text_age: Text.maximum_age,

      minimum_audio_age: Audio.minimum_age,
      maximum_audio_age: Audio.maximum_age,

      minimum_video_age: Video.minimum_age,
      maximum_video_age: Video.maximum_age,

      minimum_app_install_age: Application.minimum_application_file_age,
      maximum_app_install_age: Application.maximum_application_install_age,

      average_text_size: Text.average_size,
      average_image_size: Image.average_size,
      average_audio_size: Audio.average_size,
      average_video_size: Video.average_size,

      minimum_image_size: Image.minimum_size,
      maximum_image_size: Image.maximum_size,

      minimum_text_size: Text.minimum_size,
      maximum_text_size: Text.maximum_size,

      minimum_audio_size: Audio.minimum_size,
      maximum_audio_size: Audio.maximum_size,

      minimum_video_size: Video.minimum_size,
      maximum_video_size: Video.maximum_size
    }
  end
end
