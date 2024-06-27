FactoryBot.define do
  factory :item do
    explanation   {'美味しいオムライスです'}
    item_name     {'オムライス'}
    category_id   { 2 }
    condition_id  { 2 }
    burden_id     { 2 }
    prefecture_id { 2 }
    estimate_id   { 2 }
    price         { 300 }


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end  
  end
end
