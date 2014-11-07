FactoryGirl.define do 
  sequence :password do |n|
    "password#{n}"
  end

  sequence :artist_email do |n|
    "artist#{n}@example.com"
  end

  sequence :fan_email do |n|
    "fan#{n}@example.com"
  end

  factory :artist  do
    email { generate(:artist_email) }
    password { generate(:password) }
  end

  factory :fan  do
    email { generate(:fan_email) }
    password { generate(:password) }
  end


  sequence :reward_price do |n|
    1000 * n
  end

  factory :reward do
    price { generate(:reward_price) }
    title { "Reward for #{price}" }
    description { "Some description" }
    artist
  end

  factory :artist_pledge do
    artist
    pledge
  end

end
