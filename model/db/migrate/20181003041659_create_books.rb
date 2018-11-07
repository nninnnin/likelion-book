class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :name
      t.integer :price
      t.string :publish

      t.timestamps null: false
    end
  end
end
