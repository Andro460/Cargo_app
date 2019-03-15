class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :author
      t.string :title
      t.text :post
      t.boolean :comments_permit, default: true   

      t.timestamps
    end
  end
end
