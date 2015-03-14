FactoryGirl.define do
  factory :user do
    email "user@domain.com"
    password "12345678"
    admin false
  end

  factory :admin, class: User do
    email "admin@domain.com"
    password "12345678"
    admin true
  end

end
