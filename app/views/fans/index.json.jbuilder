json.array!(@fans) do |fan|
  json.extract! fan, :id, :name, :email
  json.url fan_url(fan, format: :json)
end
