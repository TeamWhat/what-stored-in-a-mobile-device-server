class AddDateToImageCollections < ActiveRecord::Migration
  def change
    add_column :image_collections, :date, :datetime
  end
end
