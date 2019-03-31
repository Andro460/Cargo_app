class DeleteCommentPermit < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :comment_permit
  end
end
