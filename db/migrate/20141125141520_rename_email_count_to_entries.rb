class RenameEmailCountToEntries < ActiveRecord::Migration
  def change
    rename_column :emails, :count, :entries
  end
end
