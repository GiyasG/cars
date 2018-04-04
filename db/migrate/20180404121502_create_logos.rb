class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
