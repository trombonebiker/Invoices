class Company < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :address1
  validates_presence_of :invoices_email


  def address
    @address = "#{self.address1}" + "\n\r"

    if(self.address2)
      @address = @address + "#{self.address2}" + "\n\r"
    end

    if(self.address3)
      @address = @address + "#{self.address3}" + "\n\r"
    end

    if(self.town)
      @address = @address + "#{self.town}" + "\n\r"
    end

    if(self.county)
      @address = @address + "#{self.county}" + "\n\r"
    end

    if(self.postcode)
      @address = @address + "#{self.postcode}" + "\n\r"
    end

    @address.chomp!("\n\r")
    return @address
  end


end
