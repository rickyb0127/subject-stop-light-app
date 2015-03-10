class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name

      t.timestamp null: false
    end
  end
end
