class AddRatingToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :rating, :integer
  end
end
