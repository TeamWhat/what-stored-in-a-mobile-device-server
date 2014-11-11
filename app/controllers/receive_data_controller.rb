class ReceiveDataController < ApplicationController
  require 'date'

  def receive
    subject = Subject.find_or_create(params_for_subject, params[:device_info]['0'][:datetime])
    image_collection = subject.image_collections.create
    params[:image_info].each_value do |value|
      image = image_collection.images.new(params_for_image(value))
      image.date_added = DateTime.strptime(value[:date_added], '%s') unless value[:date_added].nil?
      image.date_modified = DateTime.strptime(value[:date_modified], '%s') unless value[:date_modified].nil?
      image.date_taken = DateTime.strptime(value[:date_taken], '%s') unless value[:date_taken].nil?
      image.date = DateTime.strptime(value[:datetime], '%s') unless value[:datetime].nil?
      image.save
    end
    head :ok, content_type: 'text/html'
  end

  private

  def params_for_subject
    params.require(:device_info).require('0').permit(:device, :product, :brand, :model, :serial)
      .merge(params.permit(:uid))
  end

  def params_for_image(value)
    { is_private: value[:is_private], longitude: value[:longitude], latitude: value[:latitude], size: value[:size] }
  end
end
