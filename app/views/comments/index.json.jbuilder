json.array!(@comments) do |comment|
  json.extract! comment, :id, :title, :comment, :commentable_id, :commentable_type, :creator_id, :creator_type, :role
  json.url comment_url(comment, format: :json)
end
