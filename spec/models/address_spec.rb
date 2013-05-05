require 'spec_helper'

describe Address do

  describe 'validations' do
    let(:address) { new_address }

    before do
      expect(address).to be_valid
    end

    it 'requires state to be one of the enumerated states, either by abbreviation or full name' do
      address.state = 'Colorado'
      expect(address).to be_valid

      address.state = 'Baz'

      expect(address).to_not be_valid
    end

    it 'requires state to be present' do
      address.state = nil

      expect(address).to_not be_valid
    end

    it 'Zipcode should be 5 digits' do 
      address.zip = 1234
      expect(address).to_not be_valid

      address.zip = 'taco'
      expect(address).to_not be_valid
    end

    it 'requires zipcode to be present' do
      address.zip = nil
      expect(address).to_not be_valid      
    end
  end
end
