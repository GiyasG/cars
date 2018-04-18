class RenameTypeToBodytype < ActiveRecord::Migration
  def change
    rename_column :cars, :type, :bodytype
  end
end
