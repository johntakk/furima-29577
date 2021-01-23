FactoryBot.define do
  factory :order do
    token              { 'tok_for_test_code_123' }
    item_id            {1}
    user_id            {1}
    postal_code        {'123-1234'}
    prefecture_id      {2}
    city               {'旭川市'}
    detail_address     {'1-1'}
    tel_num            {'09012345678'}
  end
end
