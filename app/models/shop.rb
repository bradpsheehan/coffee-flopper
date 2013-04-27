class Shop < ActiveRecord::Base
  attr_accessible :groups,
    :name,
    :phone,
    :website,
    :wifi,
    :address_attributes

  has_one :address
  accepts_nested_attributes_for :address, :allow_destroy => true

  after_validation :yelp=

  def to_s
    name.split.join("+")
  end

  def yelp
    @yelp_details ||= Yelper.new(self).result
  end
end
