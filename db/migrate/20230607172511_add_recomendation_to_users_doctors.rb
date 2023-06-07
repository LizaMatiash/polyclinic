class AddRecomendationToUsersDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors_users, :recomendation, :text
    add_column :doctors_users, :status, :boolean, default: true
  end
end
