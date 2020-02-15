class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :category_id
      t.text    :post_content, null: false

      t.timestamps
    end
  end
end
