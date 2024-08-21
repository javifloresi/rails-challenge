class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :email
      t.string :address
      t.string :country
      t.text :bio
      t.decimal :rating

      t.timestamps
    end
  end
end
