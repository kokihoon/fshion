class CreateAttractions < ActiveRecord::Migration[5.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :contents
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
