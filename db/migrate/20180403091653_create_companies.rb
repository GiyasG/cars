class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.text :description
      t.string :contactname
      t.string :street
      t.string :city
      t.string :postcode
      t.string :country
      t.string :phone, null: false
      t.string :email, null: false, default: ""
      t.string :homepage
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :companies, [:name, :email], unique: true
  end
end
