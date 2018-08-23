class AddPositionToAttractions < ActiveRecord::Migration[5.0]
  def change
    add_column :attractions, :position, :string
  end
end
