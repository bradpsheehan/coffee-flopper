class Shop < ActiveRecord::Base
  attr_accessible :groups,
    :name,
    :phone,
    :website,
    :wifi,
    :address_attributes
    # is_claimed, rating, mobile_url, rating_img_url, review_count, snippet_image_url, rating_img_url_small, url, snippet_text, image_url, categories, display_phone, rating_img_url_large, id, is_closed, location

  has_one :address
  accepts_nested_attributes_for :address, :allow_destroy => true

  def to_s
    name.split.join("+")
  end
  
  def yelp_hash
    Yelper.new(@shop).hash
  end

  def yelp
    @yelp_details = Yelper.new(@shop).result
  end
end
