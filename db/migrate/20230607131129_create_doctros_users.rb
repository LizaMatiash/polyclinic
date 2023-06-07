class CreateDoctrosUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :doctros_users do |t|
      t.integer :doctor_id
      t.integer :user_id
    end
  end
end
