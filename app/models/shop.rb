class Shop < ActiveRecord::Base
  attr_accessible :groups,
    :name,
    :phone,
    :website,
    :wifi,
    :address_attributes

  validates_presence_of :name, :address

  has_one :address
  validates_associated :address
  accepts_nested_attributes_for :address, :allow_destroy => true

  def search_query
    name.split.join("+")
  end

  def yelp
    @result ||= Yelper.new(YELP_CONFIG).shop_details(self)
  end

  def similar_yelp
    @results ||= Yelper.new(YELP_CONFIG).similar_to(self)
  end

end
