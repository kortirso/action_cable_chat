FactoryGirl.define do
    factory :roommate do
        association :user
        association :room
    end
end
