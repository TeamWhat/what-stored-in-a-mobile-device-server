class AddPersonalInfoToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :gender, :string
    add_column :subjects, :country, :string
    add_column :subjects, :age, :integer
  end
end
