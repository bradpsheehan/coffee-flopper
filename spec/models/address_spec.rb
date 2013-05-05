require 'spec_helper'

describe Address do
  before do
    Geocoder.configure(:lookup => :test)

    Geocoder::Lookup::Test.add_stub(
      "CO 80204", [
        {
          'latitude'     => 40.7143528,
          'longitude'    => -74.0059731
        }
      ]
    )
    Geocoder::Lookup::Test.add_stub(
      "1062 Delaware Street Denver CO 80204", [
        {
          'latitude'     => 40.7143528,
          'longitude'    => -74.0059731
        }
      ]
    )
  end

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

    it 'requires city to be present' do
      address.city = nil
      expect(address).to_not be_valid      
    end
  end

  describe "gecoding" do
    it 'geocodes address on save' do
      address = new_address(line1: '1062 Delaware Street', city: "Denver", zip: 80204, state: "CO")

      expect(address.latitude).to be_nil
      expect(address.longitude).to be_nil

      address.save!

      expect(address.latitude).to_not be_nil
      expect(address.longitude).to_not be_nil
    end

    it 'does not geocode if the record is invalid' do
      address = new_address
      address.state = nil

      expect(address).to be_invalid
      expect(address.latitude).to be_nil
      expect(address.longitude).to be_nil

      address.save

      expect(address.latitude).to be_nil
      expect(address.longitude).to be_nil
    end

  end

  
end
