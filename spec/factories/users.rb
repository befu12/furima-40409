FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)+'1a'}
    password_confirmation {password}
    name_first            { '山田' }
    name_last             { '杏奈' }
    name_first_reading    { 'ヤマダ' }
    name_last_reading     { 'アンナ' }
    birthday              {'2000-09-28'}
  end  
end  