class AddColorToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :color, :string
  end
end
