class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :image_collection_id
      t.datetime :date
      t.string :size
      t.datetime :date_modified
      t.datetime :date_added
      t.datetime :date_taken
      t.boolean :is_private
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
