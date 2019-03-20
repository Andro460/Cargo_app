class AddUserIndex < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :user_id, :integer
    add_column :posts, :user_id, :integer
    
    add_index :comments, :user_id
    add_index :posts, :user_id
  end
end
