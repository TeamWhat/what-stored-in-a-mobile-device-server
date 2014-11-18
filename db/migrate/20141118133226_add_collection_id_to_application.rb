class AddCollectionIdToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :collection_id, :integer
  end
end
