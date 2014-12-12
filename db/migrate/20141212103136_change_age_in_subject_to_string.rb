class ChangeAgeInSubjectToString < ActiveRecord::Migration
  def change
    remove_column :subjects, :age
    add_column :subjects, :age, :string
  end
end
