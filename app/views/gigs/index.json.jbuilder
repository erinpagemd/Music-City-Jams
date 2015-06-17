json.array!(@gigs) do |gig|
  json.extract! gig, :id, :name, :location, :date, :description, :image
  json.url gig_url(gig, format: :json)
end
