class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :label
      t.string :package_name
      t.datetime :first_installed
      t.string :version_name
      t.string :target_sdk_version

      t.timestamps
    end
  end
end
