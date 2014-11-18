class ChangeImageSizeFromStringToInteger < ActiveRecord::Migration
  def change
    remove_column :images, :size
    add_column :images, :size, :integer
  end
end
