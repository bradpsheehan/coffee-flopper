require 'spec_helper'

describe Address do
  let(:valid_attributes){
    {state: "CO", zip: 80204}
  }

  let(:invalid_attributes){
    {state: "tacoshack", zip: "tacoshack"}
  }

  context 'valid attributes' do 
    it 'Must have State and Zipcode to be valid' do 
      address = Address.create!(state: "CO", zip: 80204)
      expect(address).to be_valid
    end
  end

  context 'invalid attributes' do 
    it 'State must be valid' do 
      address = Address.create(invalid_attributes)
      expect(address).to_not be_valid
    end

    it 'Zipcode should be 5 digits' do 
      address = Address.create(invalid_attributes)
      expect(address).to_not be_valid
    end
  end
end
