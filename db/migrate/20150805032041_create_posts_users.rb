class CreatePostsUsers < ActiveRecord::Migration
  def change
    create_table :posts_users, :id => false do |t|
      t.integer :user_id, :index => true
      t.integer :post_id, :index => true
    end
  end
end
