class ReceiveDataController < ApplicationController
  require 'date'

  def receive
    ActiveRecord::Base.transaction do
      subject = Subject.find_or_create(params_for_subject, params[:device_info]['0'][:datetime])
      Email.create_or_increment_count(params[:personal_info][:email])
      add_data(params, subject, 'image')
      add_data(params, subject, 'application')
      add_data(params, subject, 'text')
      add_data(params, subject, 'audio')
      add_data(params, subject, 'video')
    end

    response_json = { status: 'success' }
    render json: response_json, status: :created
  end

  private

  def add_data(params, subject, type)
    params[eval(':' + type + '_data')].each_value do |value|
      next if value[:datetime].nil?
      collection = subject.collections.find_or_create_by(date: DateTime.strptime(value[:datetime], '%s'))
      datum = eval('collection.' + type + 's.new(params_for_' + type + '(value))')
      datum.date = DateTime.strptime(value[:datetime], '%s')
      datum.date_added = DateTime.strptime(value[:date_added], '%s') if datum.respond_to?(:date_added) unless value[:date_added].nil?
      datum.date_modified = DateTime.strptime(value[:date_modified], '%s') if datum.respond_to?(:date_modified) unless value[:date_modified].nil?
      datum.date_taken = DateTime.strptime(value[:date_taken], '%s') if datum.respond_to?(:date_taken) unless value[:date_taken].nil?
      datum.first_installed = DateTime.strptime(value[:first_installed], '%s') if datum.respond_to?(:first_installed) unless value[:first_installed].nil?

      datum.save unless eval(datum.to_s + '.find_by(params_for_' + type + '(value).merge(date: datum.date).merge(eval(extra_columns(type))))')
    end
  end

  def extra_columns(type)
    case type
      when 'image' then 'date_added: datum.date_added, date_modified: datum.date_modified, date_taken: datum.date_taken'
      when 'application' then 'first_installed: application.first_installed'
      else 'date_added: datum.date_added, date_modified: datum.date_modified'
    end
  end

  def params_for_subject
    params.require(:device_info).require('0').permit(:device, :product, :brand, :model, :serial, :version, :screen_size, :free_internal_space, :total_internal_space, :free_external_space, :total_external_space)
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
