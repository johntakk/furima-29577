FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name              { 'airpods' }
    explanation              { 'explanation of airpods' }
    category_id              { 2 }
    status_id              { 2 }
    delivery_term_id { 2 }
    delivery_from_id              { 2 }
    delivery_leadtime_id { 2 }
    price          { 30000 }
  end
end
