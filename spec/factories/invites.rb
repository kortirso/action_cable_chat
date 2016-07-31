FactoryGirl.define do
    factory :invite do
        association :user
        association :friend, factory: :user
    end
end
