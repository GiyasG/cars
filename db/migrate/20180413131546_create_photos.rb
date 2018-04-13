class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.string :description
      t.references :car, index: true, foreign_key: true
      t.references :bike, index: true, foreign_key: true
      t.references :carpart, index: true, foreign_key: true
      t.references :bikepart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
