class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :tags
      t.string :album
      t.string :resolution
      t.string :size
      t.string :category
      t.integer :duration
      t.datetime :date_added
      t.datetime :date_modified
      t.datetime :date_taken
      t.string :description
      t.string :is_private
      t.float :longitude
      t.float :latitude
      t.string :artist
      t.string :language
      t.datetime :date
      t.integer :collection_id

      t.timestamps
    end
  end
end
