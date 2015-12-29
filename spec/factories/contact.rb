FactoryGirl.define do
  factory :contact, class: Pina::Models::Contact do
    name 'Testovaci'
    country_id 'CZ'
    vatin 'CZ60193336'
    duplicate_variable_symbol false
    vat_payer false
    import_received_documents 'P'

    factory :contact_diff_vatin do
      name 'test'
      vatin 'CZ25654012'
    end
  end
end
