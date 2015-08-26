FactoryGirl.define do
  factory :user do
    email { Forgery(:internet).email_address }
    password 'Password1'
    name { Forgery(:name).full_name }
    company { Forgery(:name).company_name }
    url { Forgery(:internet).domain_name }
  end
end
