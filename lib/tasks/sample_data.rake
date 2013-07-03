# rake db:populate
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "test111",
                 email: "test@163.com",
                 password: "111111",
                 password_confirmation: "111111")
    99.times do |n|
      name  = Faker::Name.name
      email = "bb-#{n+1}@gmail.com"
      password = "111112"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end