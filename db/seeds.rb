require "ffaker"

<<<<<<< HEAD
Category.create!(name: "Premier League",
	created_at: Time.zone.now)

Category.create!(name: "SeriA",
=======
Category.create!(name:  "Premier League",
	created_at: Time.zone.now)

Category.create!(name:  "SeriA",
>>>>>>> Manage Categories
	created_at: Time.zone.now)

5.times do |n|
	name  = "League#{n+1}"
	country  = "country#{n+1}"
	League.create!(name:  name,
	country: country,
	created_at: Time.zone.now)
end
