class CreateStars < ActiveRecord::Migration[8.1]
  def change
    create_table :stars do |t|
      t.string :name
      t.integer :temperature
      t.integer :magnitude
      t.integer :mass
      t.references :constellation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
