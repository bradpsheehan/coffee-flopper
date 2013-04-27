class Shop < ActiveRecord::Base
  attr_accessible :groups,
    :name,
    :phone,
    :website,
    :wifi,
    :address_attributes

  has_one :address
  accepts_nested_attributes_for :address, :allow_destroy => true
end
