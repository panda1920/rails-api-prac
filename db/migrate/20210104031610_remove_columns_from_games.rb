class RemoveColumnsFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :is_favorite, :string
    remove_column :games, :rating, :string
  end
end
