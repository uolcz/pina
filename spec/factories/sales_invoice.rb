FactoryGirl.define do
  factory :sales_invoice, class: Pina::Models::SalesInvoice do
    type :standard
    payment_method :bank_transfer
    buyer '_meta' => { 'href' => 'test/abasto_s_r_o' }
    tax_payment_date Time.now
    due_date Time.now
    issue_date Time.now + 60 * 60 * 24
    send_by_email '0'

    factory :sales_invoice_diff do
      type :penalty
    end
  end
end
