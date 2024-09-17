class CreateInspects < ActiveRecord::Migration[7.1]
  def change
    create_table :inspects do |t|
      t.string :email
      t.text :body
      t.integer :status
      t.datetime :revision_date
      t.datetime :end_date
      t.datetime :status_updated_at

      t.timestamps
    end
  end
end
