class VisualizationsController < ApplicationController
  def index
    @brand_count = Subject.group(:brand).count
  end
end
