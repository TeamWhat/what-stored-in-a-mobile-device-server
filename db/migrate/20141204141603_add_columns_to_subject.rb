class AddColumnsToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :screen_size, :string
    add_column :subjects, :free_internal_space, :string
    add_column :subjects, :total_internal_space, :string
    add_column :subjects, :free_external_space, :string
    add_column :subjects, :total_external_space, :string
  end
end
