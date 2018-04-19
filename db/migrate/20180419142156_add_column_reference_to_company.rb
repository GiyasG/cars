class AddColumnReferenceToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :carpart, index: true, foreign_key: true
  end
end
