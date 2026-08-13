class CreateConstellations < ActiveRecord::Migration[8.1]
  def change
    create_table :constellations do |t|
      t.string :name
      t.string :abbreviation
      t.string :adjective

      t.timestamps
    end
  end
end
