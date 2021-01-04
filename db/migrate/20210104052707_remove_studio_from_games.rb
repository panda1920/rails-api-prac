class RemoveStudioFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :studio, :string
  end
end
