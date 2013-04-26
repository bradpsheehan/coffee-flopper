class Shop < ActiveRecord::Base
  attr_accessible :groups, :name, :phone, :website, :wifi

  has_one :address
end
