json.array!(@comments) do |comment|
  json.extract! comment, :id, :reference, :reference, :body
  json.url comment_url(comment, format: :json)
end
