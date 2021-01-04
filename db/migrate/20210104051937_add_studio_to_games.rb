class AddStudioToGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :studio
  end
end
