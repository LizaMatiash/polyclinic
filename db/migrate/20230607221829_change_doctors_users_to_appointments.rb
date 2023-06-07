class ChangeDoctorsUsersToAppointments < ActiveRecord::Migration[7.0]
  def change
    rename_table :doctors_users, :appointments
  end
end
