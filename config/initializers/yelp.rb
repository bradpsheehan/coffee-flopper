module Services
  module Yelp
    class YelpConfig
      attr_reader :api_host, :consumer_secret, :consumer_key, :token, :token_secret

      def initialize(args)
        @api_host = args[:api_host]
        @consumer_key = args[:consumer_key]
        @consumer_secret = args[:consumer_secret]
        @token = args[:token]
        @token_secret = args[:token_secret]
      end
    end
  end
end

YELP_CONFIG = Services::Yelp::YelpConfig.new(
  :api_host => 'api.yelp.com',
  :consumer_key => 'J4CddmHi3TUMENFQyUzEiw',
  :consumer_secret => 'M6TE2ZIkmWwc-n_ys71FmlDCgc8',
  :token => 'pXmQ7Ehh6_Qz8BU1k1JSZNKsOhGxFDoy',
  :token_secret => 'GipsL-8fOnZmGa_jVKXqdM3sq7s'
  )
