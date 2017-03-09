FactoryGirl.define do
  factory :sales_invoice, class: Pina::Models::SalesInvoice do
    type :standard
    payment_method :bank_transfer
    buyer_id 'alzacz_as'
    due_date Time.now + 60 * 60 * 24 * 7
    issue_date Time.now
    tax_payment_date Time.now - 60 * 60 * 24

    factory :sales_invoice_diff do
      type :penalty
      delivery_note 'test'
      send_by_email 0
    end
  end
end
