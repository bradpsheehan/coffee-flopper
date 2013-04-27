class Yelper
  attr_reader :hash
  def initialize(shop)
    @query = "/v2/search?term=#{shop}&location=Denver&limit=1"
    @hash ||= JSON.parse(YELPSEARCH.get(@query).body)["businesses"][0]
  end

  def result
    OpenStruct.new(@hash)
  end

  def hash
    @hash
  end

end
