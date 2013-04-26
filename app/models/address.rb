class Address < ActiveRecord::Base
  attr_accessible :city, :lat, :line1, :line2, :long, :state, :zip

  belongs_to :shop
end
