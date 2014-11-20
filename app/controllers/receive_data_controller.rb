class ReceiveDataController < ApplicationController
  require 'date'

  def receive
    subject = Subject.find_or_create(params_for_subject, params[:device_info]['0'][:datetime])
    add_images(params, subject)
    add_applications(params, subject)
    add_texts(params, subject)
    head :ok, content_type: 'text/html'
  end

  private

  def add_images(params, subject)
    params[:image_info].each_value do |value|
      next if value[:datetime].nil?
      collection = subject.collections.find_or_create_by(date: DateTime.strptime(value[:datetime], '%s'))
      image = collection.images.new(params_for_image(value))
      image.date_added = DateTime.strptime(value[:date_added], '%s') unless value[:date_added].nil?
      image.date_modified = DateTime.strptime(value[:date_modified], '%s') unless value[:date_modified].nil?
      image.date_taken = DateTime.strptime(value[:date_taken], '%s') unless value[:date_taken].nil?
      image.date = DateTime.strptime(value[:datetime], '%s')
      # TODO: Delete unless from following line after we have changed Android to only send unsent data
      image.save unless Image.find_by(params_for_image(value).merge(date: image.date, date_added: image.date_added, date_modified: image.date_modified, date_taken: image.date_taken))
    end
  end

  def add_applications(params, subject)
    params[:application_data].each_value do |value|
      next if value[:datetime].nil?
      collection = subject.collections.find_or_create_by(date: DateTime.strptime(value[:datetime], '%s'))
      application = collection.applications.new(params_for_application(value))
      application.first_installed = DateTime.strptime(value[:first_installed], '%s') unless value[:first_installed].nil?
      application.date = DateTime.strptime(value[:datetime], '%s')
      # TODO: Delete unless from following line after we have changed Android to only send unsent data
      application.save unless Application.find_by(params_for_application(value).merge(date: application.date, first_installed: application.first_installed))
    end
  end

# "text_data"=>{"0"=>{"datetime"=>"1416481951", "date_added"=>"1416481941", "date_modified"=>"1416481806", "size"=>"21"}}
  def add_texts(params, subject)
    params[:text_data].each_value do |value|
      next if value[:datetime].nil?
      collection = subject.collections.find_or_create_by(date: DateTime.strptime(value[:datetime], '%s'))
      text = collection.texts.new(params_for_text(value))
      text.date_added = DateTime.strptime(value[:date_added], '%s') unless value[:date_added].nil?
      text.date_modified = DateTime.strptime(value[:date_modified], '%s') unless value[:date_modified].nil?
      text.date = DateTime.strptime(value[:datetime], '%s')
      text.save unless Text.find_by(
        params_for_text(value)
        .merge(date: text.date, date_added: text.date_added, date_modified: text.date_modified)
      )
    end
  end

  def params_for_subject
    params.require(:device_info).require('0').permit(:device, :product, :brand, :model, :serial)
      .merge(params.permit(:uid))
      .merge(params.require(:personal_info).permit(:gender, :age, :country))
  end

  def params_for_image(value)
    { is_private: value[:is_private], longitude: value[:longitude], latitude: value[:latitude], size: value[:size] }
  end

  def params_for_application(value)
    { label: value[:application_label], package_name: value[:package_name], version_name: value[:version_name], target_sdk_version: value[:target_sdk_version] }
  end

  def params_for_text(value)
    { size: value[:size], mime_type: value[:mime_type] }
  end
end
