FactoryBot.define do
  factory :user do
    sequence(:first_name) { |k| "Mark-#{k}" }
    sequence(:last_name) { |k| "Holmberg-#{k}" }
    sequence(:email) { |k| "user-#{k}@example.com" }
    password { 'foobar123' }
    password_confirmation { 'foobar123' }
  end
end
