class AddDateToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :date, :datetime
  end
end
