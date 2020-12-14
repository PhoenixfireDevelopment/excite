# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: ENV.fetch('SEED_USER_FIRST_NAME', nil),
             last_name: ENV.fetch('SEED_USER_LAST_NAME', nil),
             email: ENV.fetch('SEED_USER_EMAIL', nil),
             password: ENV.fetch('SEED_USER_PASSWORD', nil),
             password_confirmation: ENV.fetch('SEED_USER_PASSWORD_CONFIRMATION', nil))

# # https://randomuser.me/api/?results=49&password=upper,lower,32&nat=us
# data = JSON.parse(File.open('/home/mark/Desktop/seed_users.json').read)
# data['results'].each do |result|
#   User.create!({
#     first_name: result['name']['first'],
#     last_name: result['name']['last'],
#     email: result['email'],
#     password: result['login']['password'],
#     password_confirmation: result['login']['password']
#   })
# end
