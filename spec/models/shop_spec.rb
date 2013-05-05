require 'spec_helper'

describe Shop do 

  context 'validations' do 

    it '#new is valid when a name is submitted' do 
      name = "Mikes Coffee"
      shop = Shop.create(name: name)
      expect(shop).to be_valid
      expect(shop.name).to eq name
    end

    it '#new is invalid without a name' do 
      shop = Shop.create
      expect(shop).to be_invalid
    end
  end
end
