require 'rails_helper'

RSpec.describe Company, type: :model do
  subject {
    described_class.new(
      name: "Anything",
      address1: "Anything",
      address2: "Anything",
      address3: "Anything",
      town: "Any town",
      county: "Any county",
      postcode: "Any postcode",
      phone: "Any phone 123",
      invoices_email: "invoices@example.com"
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an invoices email address" do
    subject.invoices_email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a first line of an address" do
    subject.address1 = nil
    expect(subject).to_not be_valid
  end

  it "can return it's own full address" do
    full_address = "Anything\n\rAnything\n\rAnything\n\rAny town\n\rAny county\n\rAny postcode"
    expect(subject.address).to eql(full_address)
  end

end
