FactoryGirl.define do
  factory :purchase_invoice, class: Pina::Models::PurchaseInvoice do
    type :standard
    payment_method :bank_transfer
    seller_id 'alzacz_as'
    public_id 20_190_029
    variable_symbol 20_190_029
    bank_country_id 'CZ'
    iban_or_account '35-6420840257/0100'
    due_date Time.now + 60 * 60 * 24 * 7
    issue_date Time.now
    tax_payment_date Time.now - 60 * 60 * 24

    factory :purchase_invoice_diff do
      type :penalty
      iban_or_account '2923001/0100'
      public_id 20_190_030
      variable_symbol 20_190_030
    end
  end
end
