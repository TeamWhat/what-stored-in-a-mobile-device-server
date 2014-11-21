class VisualizationsController < ApplicationController
  def index
    @brand_count = Subject.group(:brand).count
    @average_text_file_age = Text.average_text_file_age
    @average_image_file_age = Image.average_image_file_age
  end
end
