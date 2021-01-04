class AddYearToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :year, :integer
  end
end
