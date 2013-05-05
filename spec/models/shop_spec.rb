require 'spec_helper'

describe Shop do 

  context 'validations' do 
    let(:shop) do
      new_shop.tap do |shop|
        shop.address = new_address
      end
    end

    before do
      expect(shop).to be_valid
    end

    it 'requires a name' do 
      shop.name = nil
      expect(shop).to be_invalid
    end

    it 'requires an address' do
      shop.address = nil
      expect(shop).to_not be_valid
    end      
  end
end
