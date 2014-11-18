class RenameImageCollectionToCollection < ActiveRecord::Migration
  def change
    rename_table :image_collections, :collections
    rename_column :images, :image_collection_id, :collection_id
  end
end
