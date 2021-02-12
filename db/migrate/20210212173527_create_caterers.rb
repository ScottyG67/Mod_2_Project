class CreateCaterers < ActiveRecord::Migration[6.1]
  def change
    create_table :caterers do |t|
      t.string :name
      t.string :food_type
      t.float :cost_per_head
      t.text :description

      t.timestamps
    end
  end
end
