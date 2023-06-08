class AddAdminFlagToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :admin, :boolean
  end
end
