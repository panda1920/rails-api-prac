class AddColumnsToStudios2 < ActiveRecord::Migration[6.0]
  def change
    add_column :studios, :studio_type, :integer
  end
end
