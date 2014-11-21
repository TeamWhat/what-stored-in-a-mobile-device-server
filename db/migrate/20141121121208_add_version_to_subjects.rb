class AddVersionToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :version, :string
  end
end
