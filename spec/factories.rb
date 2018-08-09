FactoryBot.define do 

  factory :organization do 
    sequence(:name)        { |n| "Red Cross#{n}" }
    sequence(:description) { |n| "help the needy#{n}" }
    sequence(:bio)         { |n| "people#{n}" }
    sequence(:email)       { |n| "Red#{n}@Cross.com" }
    sequence(:phone)       { |n| "#{n}000000" }
    sequence(:address)     { |n| "#{n}234 obt way" }
    role 0
  end

  factory :user do
    sequence(:first_name) { |n| "Mary#{n}" }
    sequence(:last_name)  { |n| "Davenport#{n}" }
    sequence(:email)      { |n| "maryDavenportNo#{n}@gmail.com" }
    sequence(:phone)      { |n| "#{n}000000" }
    sequence(:sex)        { |n| "m#{n}f" }
    sequence(:skills)     { |n| "walking#{n}" }
    sequence(:password)   { |n| "password#{n}" }
  end

end