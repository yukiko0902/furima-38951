FactoryBot.define do
  factory :user do
    nickname                 {Faker::Name.initials}
    email                    {Faker::Internet.free_email}
    password                 {Faker::Internet.password(min_length: 6)}
    password_confirmation    {password}
    last_name                {'やマ田'}
    first_name               {'太ロう'}
    last_name_kanacharacters {'ヤマダ'}
    first_name_kanacharacters{'タロウ'}
    birthday                 {Faker::Date.between(from: '1930-01-01', to: '2018-12-31')}
  end
end