class CreateVenues < ActiveRecord::Migration[6.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :capacity
      t.float :cost

      t.timestamps
    end
  end
end
