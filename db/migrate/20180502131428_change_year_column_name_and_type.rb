class ChangeYearColumnNameAndType < ActiveRecord::Migration
  def change
    rename_column :cars, :year, :makeyear
    change_column :cars, :makeyear, :string
  end
end
