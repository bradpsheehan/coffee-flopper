class Shop < ActiveRecord::Base
  attr_accessible :groups,
    :name,
    :phone,
    :website,
    :wifi,
    :address_attributes

  has_one :address
  accepts_nested_attributes_for :address, :allow_destroy => true

  def to_s
    name.split.join("+")
  end
  
  def set_yelp
    yelp_hash.inspect
    # self.update_attributes(yelp_hash)  
  end

  def yelp_hash
    Yelper.new(@shop).hash
  end

  def yelp
    @result ||= Yelper.new(self).result
  end
end
