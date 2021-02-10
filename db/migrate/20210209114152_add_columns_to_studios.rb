class AddColumnsToStudios < ActiveRecord::Migration[6.0]
  def change
    add_column :studios, :type, :integer
  end
end
