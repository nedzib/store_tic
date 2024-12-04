class CreateAditions < ActiveRecord::Migration[7.1]
  def change
    create_table :aditions do |t|
      t.string :name
      t.float :price_cents
      t.text :body
      t.references :inspect, null: false, foreign_key: { to_table: :inspects }

      t.timestamps
    end
  end
end
