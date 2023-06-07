class AddCategoryIdToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :doctors, :category
  end
end
