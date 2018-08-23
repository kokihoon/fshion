class AddOneToTravel < ActiveRecord::Migration[5.0]
  def change
    add_column :travels, :one, :Integer
  end
end
