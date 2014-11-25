class AddCountToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :count, :integer
  end
end
