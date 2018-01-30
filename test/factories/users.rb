FactoryGirl.define do
  factory :user do
    first_name {["Brad", "Chad", "Blake", "Lazer", "Blazer"].sample}
    last_name {["Brad", "Chad", "Blake", "Lazer", "Blazer"].sample}
    sequence(:email) { |n| "bitchin#{n}@gmail.com" }
    password "password"
  end
end
