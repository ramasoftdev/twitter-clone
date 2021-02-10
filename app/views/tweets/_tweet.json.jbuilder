json.extract! tweet, :id, :twett_content, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
