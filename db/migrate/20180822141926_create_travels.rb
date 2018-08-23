class CreateTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :travels do |t|
      t.string :day1
      t.string :day2
      t.string :day3
      t.string :day4
      t.string :day5
      t.string :day6
      t.string :day7
      t.string :day8
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
