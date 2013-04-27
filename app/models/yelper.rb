class Yelper
  attr_reader :query
  def initialize(shop)
    @query = "/v2/search?term=#{shop}&location=Denver&limit=1"
  end

  def result
    @result ||= JSON.parse(YELPSEARCH.get(@query).body)["businesses"][0]
    OpenStruct.new(@result)
  end

end
