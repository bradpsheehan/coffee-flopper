class Yelper
  def initialize(config)
    @config = config
  end

  def shop_details(shop)
    query = "/v2/search?term=#{shop.search_query}&location=#{shop.address.city}&limit=1"
    OpenStruct.new(JSON.parse(access_token.get(query).body)["businesses"][0])
  end

  def similar_to(shop)
    query = "/v2/search?term=#{shop.yelp.categories[0][1]}&location=#{shop.address.city}&limit=10&sort=2"
    results = JSON.parse(access_token.get(query).body)["businesses"]
    build_yelps(results).reject {|b|b.id == shop.yelp.id}
  end

private

  def build_yelps(businesses)
    businesses.map do |business|
      OpenStruct.new(business)
    end
  end

  def consumer
    @consumer ||= OAuth::Consumer.new(@config.consumer_key, @config.consumer_secret, {:site => "http://#{@config.api_host}"})
  end

  def access_token
    @access_token ||= OAuth::AccessToken.new(consumer, @config.token, @config.token_secret)
  end
end
