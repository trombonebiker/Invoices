require 'rails_helper'

RSpec.describe "Companies", type: :request do
  describe "GET /companies" do
    it "lists the name of every company" do
      companies = FactoryBot.create_list(:company, 3)
      get companies_path
      expect(response).to have_http_status(200)

      companies.each do |company|
        expect(response.body).to include(company.name)
      end
    end
  end


  describe "GET /companies/:id" do
    it "shows the details of a company" do
      company = FactoryBot.create(:company)
      get company_path(company.id)
      expect(response).to have_http_status(200)
      expect(response.body).to include(company.name)
      expect(response.body).to include(company.address)
      expect(response.body).to include(company.invoices_email)
    end
  end


  describe "POST companies#create" do
    it "should create a new company" do
      visit new_company_path

      company = FactoryBot.build(:company)
      fill_in "company_name", with: "#{company.name}"
      fill_in "company_address1", with: "#{company.address1}"
      fill_in "company_address2", with: "#{company.address2}"
      fill_in "company_address3", with: "#{company.address3}"
      fill_in "company_town", with: "#{company.town}"
      fill_in "company_county", with: "#{company.county}"
      fill_in "company_postcode", with: "#{company.postcode}"
      fill_in "company_phone", with: "#{company.phone}"
      fill_in "company_invoices_email", with: "#{company.invoices_email}"

      expect { click_button "Create Company" }.to change(Company, :count).by(1)
    end
  end


  describe "PUT stories#update" do
    it "should update an existing company" do
      company = FactoryBot.create(:company)
      visit edit_company_path(company)

      fill_in "company_name", with: "testing_name"
      fill_in "company_address1", with: "testing_address1"
      fill_in "company_address2", with: "testing_address2"
      fill_in "company_address3", with: "testing_address3"
      fill_in "company_town", with: "testing_town"
      fill_in "company_county", with: "testing_county"
      fill_in "company_postcode", with: "testing_postcode"
      fill_in "company_phone", with: "testing_phone"
      fill_in "company_invoices_email", with: "testing_invoices_email"

      click_button "Update Company"
      expect(company.reload.name).to eq "testing_name"
      expect(company.reload.address1).to eq "testing_address1"
      expect(company.reload.address2).to eq "testing_address2"
      expect(company.reload.address3).to eq "testing_address3"
      expect(company.reload.town).to eq "testing_town"
      expect(company.reload.county).to eq "testing_county"
      expect(company.reload.postcode).to eq "testing_postcode"
      expect(company.reload.phone).to eq "testing_phone"
      expect(company.reload.invoices_email).to eq "testing_invoices_email"
    end
  end


  describe "DELETE companies#destroy" do
    it "should delete a company" do
      company = FactoryBot.create(:company)
      visit company_path(company)
      page.should have_link("Delete")
      expect { click_link "Delete" }.to change(Company, :count).by(-1)
    end
  end

end
