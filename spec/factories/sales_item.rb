FactoryGirl.define do
  factory :sales_item, class: Pina::Models::SalesItem do
    product_id 'drmaj'
    quantity 1
    unit_price 200
    percent_discount 1
  end
end
