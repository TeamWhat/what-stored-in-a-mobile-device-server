class CreateImageCollections < ActiveRecord::Migration
  def change
    create_table :image_collections do |t|
      t.integer :subject_id

      t.timestamps
    end
  end
end
