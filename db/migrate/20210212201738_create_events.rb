class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :time
      t.integer :durations_hours
      t.references :venue, null: false, foreign_key: true
      t.references :caterer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
