class RenameTwettContentToTweetContent < ActiveRecord::Migration[6.1]
  def change
    rename_column :tweets, :twett_content, :tweet_content
  end
end
