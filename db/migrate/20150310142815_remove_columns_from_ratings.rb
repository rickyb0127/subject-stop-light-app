class RemoveColumnsFromRatings < ActiveRecord::Migration
  def change
    remove_column :ratings, :red
    remove_column :ratings, :yellow
    remove_column :ratings, :green
  end
end
