class RemoveColumnsFromStudios < ActiveRecord::Migration[6.0]
  def change
    remove_column :studios, :type, :string
  end
end
