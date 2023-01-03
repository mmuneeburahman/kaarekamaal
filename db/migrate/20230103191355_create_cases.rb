class CreateCases < ActiveRecord::Migration[7.0]
  def change
    create_table :cases do |t|
      t.string :title
      t.integer :type
      t.text :description
      t.string :location
      t.date :deadline
      t.boolean :is_verified
      t.boolean :is_suspended
      t.boolean :finance_required
      t.integer :amount
      t.integer :up_votes
      t.boolean :is_closed
      t.date :closed_date
      
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
