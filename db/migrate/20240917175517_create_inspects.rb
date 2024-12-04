class CreateInspects < ActiveRecord::Migration[7.1]
  def change
    create_table :inspects do |t|
      t.string :email
      t.string :phone
      t.text :body
      t.integer :status, default: 0
      t.datetime :revision_date
      t.string :revision_time
      t.datetime :end_date
      t.datetime :status_updated_at
      t.string :hash_finder
      t.references :kind, null: false, foreign_key: { to_table: :kinds }

      t.timestamps
    end
  end
end
