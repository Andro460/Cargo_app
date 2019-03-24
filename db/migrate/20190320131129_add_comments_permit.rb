class AddCommentsPermit < ActiveRecord::Migration[5.2]
  
    def change
      change_column_default :posts, :comments_permit, from: true, to: false
          
    end
  
end
 