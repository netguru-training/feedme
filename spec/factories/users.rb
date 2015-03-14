FactoryGirl.define do
  factory :user do
    email "user@domain.com"
    admin false
  end

  factory :admin, class: User do
    email "admin@domain.com"
    admin true
  end

end
