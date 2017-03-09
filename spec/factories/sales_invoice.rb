FactoryGirl.define do
  factory :sales_invoice, class: Pina::Models::SalesInvoice do
    type :standard
    payment_method :bank_transfer
    buyer_id 'alzacz_as'

    factory :sales_invoice_diff do
      type :penalty
    end
  end
end
