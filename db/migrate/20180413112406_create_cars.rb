class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make, null: false
      t.string :model, null: false, unique: true
      t.datetime :year
      t.string :body
      t.string :version
      t.string :classification
      t.string :type
      t.integer :door
      t.integer :seat
      t.string :engineplace
      t.string :drivetrain
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
