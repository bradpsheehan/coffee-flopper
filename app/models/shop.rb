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

  def to_s
    name.split.join("+")
  end
  

  def yelp_hash
    Yelper.new(@shop).hash
  end

  def yelp
    @result ||= Yelper.new(self).result
  end
end
