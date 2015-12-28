FactoryGirl.define do
  factory :contact, class: Pina::Models::Contact do
    name 'Testovaci'
    country_id 'CZ'
    vatin 'CZ129451811'
    duplicate_variable_symbol false
    vat_payer false
    import_received_documents 'P'

    factory :contact_diff_vatin do
      name 'test'
      vatin 'CZ321548986'
    end
  end
end
