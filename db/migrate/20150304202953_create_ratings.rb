class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :subject_id
      t.string :red
      t.string :yellow
      t.string :green
      t.string :comments

      t.timestamp null: false
    end
  end
end
