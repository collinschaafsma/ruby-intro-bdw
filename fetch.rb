require 'net/http'
require 'json'

class Fetch

  @username = "collinschaafsma"

  def initialize(username="collinschaafsma")
    @username = username
  end

  def self.write_latest_tweet(write_to="/Users/collin/Desktop/latest_tweet.txt")
    File.open(write_to, 'w') {|f| f.write(self.new(@username).latest_tweet) }
  end

  def latest_tweet
    JSON.parse(
      Net::HTTP.get_response(
        URI("http://api.twitter.com/1/users/show.json?screen_name=#{@username}")
      ).body
    )['status']['text']
  end

end
