class ReceiveDataController < ApplicationController
  require 'date'

  # Handles receiving the data from the Android application
  def receive
    # Use transaction to prevent n + 1 problems
    ActiveRecord::Base.transaction do
      subject = Subject.find_or_create(params_for_subject, params[:device_info][latest_device_info_index][:datetime])
      Email.create_or_increment_count(params[:personal_info][:email])
      add_data(subject, 'image')
      add_data(subject, 'application')
      add_data(subject, 'text')
      add_data(subject, 'audio')
      add_data(subject, 'video')
    end

    response_json = { status: 'success' }
    render json: response_json, status: :created
  end

  private

  # Saves data from a specific params field
  def add_data(subject, type)
    params_field(type).each_value do |value|
      next if value[:datetime].nil?
      collection = subject.collections.find_or_create_by(date: DateTime.strptime(value[:datetime], '%s'))
      datum = create_piece_of_data(collection, type, value)
      datum.date = date_to_string(value, :datetime) if can_be_added(value, :datetime, datum)
      datum.date_added = date_to_string(value, :date_added) if can_be_added(value, :date_added, datum)
      datum.date_modified = date_to_string(value, :date_modified) if can_be_added(value, :date_modified, datum)
      datum.date_taken = date_to_string(value, :date_taken) if can_be_added(value, :date_taken, datum)
      datum.first_installed = date_to_string(value, :first_installed) if can_be_added(value, :first_installed, datum)

      datum.save
    end
  end

  def can_be_added(value, date_field, datum)
    not value[date_field].nil? and datum.respond_to?(date_field)
  end

  def date_to_string(value, date_field)
    DateTime.strptime(value[date_field], '%s')
  end

  def latest_device_info_index
    params[:device_info].keys.max_by { |o| o.to_i }
  end

  # Creates a piece of data into a collection
  # e.g. collection.images.new(params_for_image(value))
  def create_piece_of_data(collection, type, value)
    type_collection = collection.send(type + 's')
    params_for_type = send('params_for_' + type, value)
    type_collection.send(:new, params_for_type)
  end

  def params_field(type)
    params[eval(':' + type + '_data')]
  end

  def params_for_subject
    params.require(:device_info).require(latest_device_info_index).permit(:device, :product, :brand, :model, :serial, :version, :screen_size, :free_internal_space, :total_internal_space, :free_external_space, :total_external_space)
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

  def params_for_audio(value)
    {
      album: value[:album], is_alarm: value[:is_alarm], is_ringtone: value[:is_ringtone], is_music: value[:is_music],
      is_podcast: value[:is_podcast], size: value[:size], composer: value[:composer], duration: value[:duration],
      is_notification: value[:is_notification], year: value[:year], artist: value[:artist]
    }
  end

  def params_for_video(value)
    {
      tags: value[:tags],
      album: value[:album],
      resolution: value[:resolution],
      size: value[:size],
      category: value[:category],
      duration: value[:duration],
      description: value[:description],
      is_private: value[:is_private],
      longitude: value[:longitude],
      latitude: value[:latitude],
      artist: value[:artist],
      language: value[:language]
    }
  end
end
