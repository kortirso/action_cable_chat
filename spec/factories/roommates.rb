FactoryGirl.define do
    factory :roommate do
        association :user
        association :room
        association :contact, factory: :user
    end
end
