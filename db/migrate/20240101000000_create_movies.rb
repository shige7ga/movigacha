class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :classification, null: false
      t.string :category, null: false
      t.string :mood, null: false
      t.text :overview, null: false

      t.timestamps
    end
  end
end
