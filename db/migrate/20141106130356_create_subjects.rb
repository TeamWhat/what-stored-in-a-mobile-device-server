class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.datetime :date
      t.string :brand
      t.string :model
      t.string :device
      t.string :product
      t.string :serial
      t.string :uid

      t.timestamps
    end
  end
end
