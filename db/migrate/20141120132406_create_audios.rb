class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.datetime :date
      t.integer :collection_id
      t.string :album
      t.string :artist
      t.string :composer
      t.integer :year
      t.datetime :date_added
      t.datetime :date_modified
      t.integer :size
      t.string :is_alarm
      t.string :is_music
      t.string :is_notification
      t.string :is_podcast
      t.string :is_ringtone
      t.integer :duration

      t.timestamps
    end
  end
end
