class AddCommentsPermit < ActiveRecord::Migration[5.2]
  
    def change
      change_column_default :posts, :comments_permit, from: true, to: false
      remove_column :posts, :comment_permit, :boolean, default: false
      
     
    end
  
end
 