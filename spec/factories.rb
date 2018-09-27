FactoryBot.define do 
  factory :organization do 
    sequence(:name)        { |n| "Red Cross#{n}" }
    sequence(:description) { |n| "help the needy#{n}" }
    sequence(:bio)         { |n| "people#{n}" }
    sequence(:email)       { |n| "Red#{n}@Cross.com" }
    sequence(:phone)       { |n| "#{n}000000" }
    sequence(:address)     { |n| "#{n}234 obt way" }
    user
  end

  factory :user do
    sequence(:first_name) { |n| "keke#{n}" }
    sequence(:last_name)  { |n| "Davenport#{n}" }
    sequence(:email)      { |n| "keke#{n}@aol.com" }
    sequence(:phone)      { |n| "#{n}000000" }
    sequence(:sex)        { |n| "m#{n}f" }
    sequence(:skills)     { |n| "walking#{n}" }
    password "pass"
  end

  factory :location do
    sequence(:long)       { |n| "38.7306#{n}".to_i }
    sequence(:lat)        { |n| "98.2281#{n}".to_i }
    sequence(:country)    { |n| "keke#{n}@aol.com" }
    sequence(:state)      { |n| "#{n}000000" }
    sequence(:city)       { |n| "m#{n}f" }
  end
end

