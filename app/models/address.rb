class Address < ActiveRecord::Base
  attr_accessible :line1, :line2, :city, :state, :zip, :latitude, :longitude

  belongs_to :shop

  validates_presence_of :zip, :state

  # validates_format_of :state, :message => "only be two characters"
  
  validates_format_of :zip, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"

  geocoded_by :full_street_address
  
  after_validation :geocode

  def full_street_address
    "#{line1} #{line2} #{city}, #{state} #{zip}"    
  end
end
