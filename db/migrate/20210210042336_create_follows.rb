class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.references :following_user, null: false
      t.references :follower_user, null: false

      t.timestamps
    end
    add_foreign_key :follows, :users, column: :following_user_id, primary_key: :id
    add_foreign_key :follows, :users, column: :follower_user_id, primary_key: :id
  end
end
