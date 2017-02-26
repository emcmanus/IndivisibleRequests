json.extract! post, :id, :title, :body, :user_id, :view_count, :created_at, :updated_at
json.url post_url(post, format: :json)
