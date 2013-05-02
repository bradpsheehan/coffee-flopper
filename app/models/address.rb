class Address < ActiveRecord::Base
  attr_accessible :line1, :line2, :city, :state, :zip, :latitude, :longitude

  belongs_to :shop

  geocoded_by :full_street_address
  
  after_validation :geocode

  def full_street_address
    "#{line1} #{line2} #{city}, #{state} #{zip}"    
  end
end
