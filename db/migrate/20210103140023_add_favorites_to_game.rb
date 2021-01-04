class AddFavoritesToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :is_favorite, :boolean
  end
end
