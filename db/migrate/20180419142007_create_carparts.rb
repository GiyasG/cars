class CreateCarparts < ActiveRecord::Migration
  def change
    create_table :carparts do |t|
      t.string :name
      t.string :code
      t.string :description
      t.string :detail
      t.float :price
      t.integer :stock
      t.integer :reserved
      t.datetime :reservedtime
      t.datetime :paidtime
      t.integer :sold
      t.references :company, index: true, foreign_key: true
      t.references :car, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
