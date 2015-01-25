FactoryGirl.define do
  factory :task do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    finished false
  end

end
