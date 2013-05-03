consumer_key = 'J4CddmHi3TUMENFQyUzEiw'
consumer_secret = 'M6TE2ZIkmWwc-n_ys71FmlDCgc8'
token = 'pXmQ7Ehh6_Qz8BU1k1JSZNKsOhGxFDoy'
token_secret = 'GipsL-8fOnZmGa_jVKXqdM3sq7s'

api_host = 'api.yelp.com'

consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})

YELPSEARCH = OAuth::AccessToken.new(consumer, token, token_secret)
