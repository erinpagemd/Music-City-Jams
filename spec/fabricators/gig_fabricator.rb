Fabricator(:gig) do
  name        {Faker::Name.name}
  location    {Faker::Company.name}
  date        {Faker::Date.between(2.days.ago, 30.days.from_now)}
  description {Faker::Hacker.say_something_smart}
  user(fabricator: :user)
end
