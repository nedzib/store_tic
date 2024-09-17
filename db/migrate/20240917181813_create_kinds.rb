class CreateKinds < ActiveRecord::Migration[7.1]
  def change
    create_table :kinds do |t|
      t.string :name
      t.float :revision_price_cents
      t.float :margin

      t.timestamps
    end
  end
end
