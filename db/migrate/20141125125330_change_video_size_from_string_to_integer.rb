class ChangeVideoSizeFromStringToInteger < ActiveRecord::Migration
  def change
    remove_column :videos, :size
    add_column :videos, :size, :integer
  end
end
