module ShopsHelper

  def title
    %w(Shane-Banana FLOPPERS Floptastics FLOP-Johnsons __the-flippy-floppies__ tacos FLOOOOPs COFFEE-FLOPPERS).sample
  end

  def review(shop)
    link_to(image_tag(shop.yelp.rating_img_url_large), shop.yelp.mobile_url)
  end

end
