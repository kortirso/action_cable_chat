FactoryGirl.define do
    factory :message do
        association :user
        association :room
        body 'Message'
    end
end
