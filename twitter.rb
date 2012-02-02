require 'net/http'
require 'json'

class Twitter

  TWITTER_API_URL   = "http://api.twitter.com/1"
  DEFAULT_SAVE_FILE = "/Users/collin/Desktop/latest_tweet.txt"

  def initialize(username="collinschaafsma")
    @username = username
  end

  # Get's the users status if found or throws an exception
  def status!
    @text = JSON.parse(api_response)['status']['text']
    self
  end

  # Get's the users status if found
  def status
    response = JSON.parse(api_response)
    @text = response['status']['text'] if response.has_key?('status')
    self
  end

  # Saves the status text to a file
  def write(save_file=DEFAULT_SAVE_FILE)
    File.open(save_file, 'w') {|f| f.write(@text) }
    puts "Tweet saved to \"#{save_file}\""
  end

  # Returns the text of a status
  def text
    @text
  end

  # Returns the Twitter username
  def username
    @username
  end

  private

  # Makes GET request to Twitter API
  def api_response
    Net::HTTP.get_response(
      URI("#{TWITTER_API_URL}/users/show.json?screen_name=#{@username}")
    ).body
  end

end
