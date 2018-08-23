class AddValueToAttractions < ActiveRecord::Migration[5.0]
  def change
    add_column :attractions, :value, :string
  end
end
