class AddCommentsPermit < ActiveRecord::Migration[5.2]
  
    def change
      remove_column :posts, :comments_permit, :boolean, default: true
      remove_column :posts, :comment_permit, :boolean, default: false
      
      add_column :posts, :comments_permit, :boolean, default: false  
    end
  
end
