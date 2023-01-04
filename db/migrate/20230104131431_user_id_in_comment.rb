class UserIdInComment < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :user_id, :string
    add_column :comments, :user_id, :integer
  end
end
