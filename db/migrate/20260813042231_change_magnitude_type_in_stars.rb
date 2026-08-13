class ChangeMagnitudeTypeInStars < ActiveRecord::Migration[8.1]
  def change
    change_column :stars, :magnitude, :float
  end
end