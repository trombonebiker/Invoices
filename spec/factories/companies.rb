FactoryBot.define do
  factory :company do
    address1          '4th Floor'
    address2          '36-38 Hatton Garden'
    town              'London'
    postcode          'EC1N 8EB'
    phone             '020 7307 8480'
    invoices_email    'invoices@underbelly.co.uk'

    sequence(:name) { |n| "company#{n}" }
  end
end
