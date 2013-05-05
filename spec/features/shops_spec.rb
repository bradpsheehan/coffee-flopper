require "spec_helper"

describe Shop do


  describe '#new' do 
    let(:shop_name){ "Shop Name" }
    let(:zip){ 80204 }
    let(:state){ "CO" }

    context 'with valid attributes' do 
      it "should have a name" do 
        visit new_shop_path
        fill_in "shop_name", :with => shop_name
        fill_in "shop_address_attributes_state", :with => state
        fill_in "shop_address_attributes_zip", :with => zip
        click_on "Create Shop"
        shop = Shop.first
        expect(current_path).to eq shop_path(shop)
      end
    end

    context 'invalid attributes' do 
      it 'should be invalid without a name' do 
        visit new_shop_path
        click_on "Create Shop"
        expect(current_path).to eq shops_path
        expect( page ).to have_content "can't be blank"
      end
    end
  end
end
