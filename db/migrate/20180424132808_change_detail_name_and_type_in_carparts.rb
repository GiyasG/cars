class ChangeDetailNameAndTypeInCarparts < ActiveRecord::Migration
  def change
    rename_column :carparts, :detail, :details
    change_column :carparts, :details, :text
  end
end
