class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.datetime :date
      t.integer :size
      t.datetime :date_modified
      t.datetime :date_added
      t.string :mime_type
      t.integer :collection_id

      t.timestamps
    end
  end
end
