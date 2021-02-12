class CreateVenueCaterers < ActiveRecord::Migration[6.1]
  def change
    create_table :venue_caterers do |t|
      t.references :venue, null: false, foreign_key: true
      t.references :caterer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
