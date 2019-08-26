require "ffaker"

namespace :seed_data do
  desc "Seed data"

  task users: :environment do
    User.create!(
      email: "admin@gmail.com ",
      name: "DangPham",
      password: "111111",
      is_admin: 1,
      created_at: Time.zone.now)

      User.create!(
        email: "member@gmail.com",
        name: "member",
        password: "111111",
        is_admin: 0,
        created_at: Time.zone.now)
  end

  task categories: :environment do
    Category.create!(name: "Premier League",
      created_at: Time.zone.now)
    
    Category.create!(name: "SeriA",
      created_at: Time.zone.now)
  end
end
