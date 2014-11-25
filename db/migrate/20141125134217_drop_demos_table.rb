class DropDemosTable < ActiveRecord::Migration
  def up
    drop_table :products
  end

  def down
    create_table "demos", force: true do |t|
      t.string   "message"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
