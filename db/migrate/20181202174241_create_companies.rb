class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string  :name
      t.string  :address1
      t.string  :address2
      t.string  :address3
      t.string  :town
      t.string  :county
      t.string  :postcode
      t.string  :phone
      t.string  :invoices_email
      
      t.timestamps
    end
  end
end
