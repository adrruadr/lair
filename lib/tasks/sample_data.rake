namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example Adruser",
                 email: "adrtest@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "adrtest-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
  desc "Fill database with admin user"
  task apopulate: :environment do
    admin = User.create!(name: "Admin User",
                         email: "admin1@railstutorial.org",
                         password: "123123",
                         password_confirmation: "123123",
                         admin: true)
  end
  task mpopulate: :environment do
    users = User.all.limit(6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end