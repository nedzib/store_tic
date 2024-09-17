class CreateAditions < ActiveRecord::Migration[7.1]
  def change
    create_table :aditions do |t|
      t.string :name
      t.float :price_cents
      t.text :body

      t.timestamps
    end
  end
end
