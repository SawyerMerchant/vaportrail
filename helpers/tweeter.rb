require 'twitter'

class Tweeter



  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
  end

  def test_tweet
    @client.update("A Tweet from the command line")
  end

  def send_tweet(handle, link, description)
    @client.update("Checkout#{handle} 's #{description}: #{link}")
  end


  def get_content
    a = File.readlines("queue.txt")
    content = a[0]
    open('queue.txt', 'w') do |file|
      file.puts a[1,a.size]
    end
    p content.split(',')
  end

end

# t = Tweeter.new
# t.get_content