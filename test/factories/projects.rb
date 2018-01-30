FactoryGirl.define do
  factory :project do
    sequence(:title) {|a| "Stupid title #{a}"}
    description "Some type of description"
    goal 1000
    start_date Time.now
    end_date  Time.now + 2.days
  end
end
