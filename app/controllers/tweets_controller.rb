require 'twitter'

class TweetsController < ApplicationController

  before_action :create_client
  
  def index
    batch_size = 10
    @twitter_handle = "ncirl"

    @tweets = @client.user_timeline(@twitter_handle).take(batch_size)    
    @friends = @client.friends(@twitter_handle).take(batch_size)
    @followers = @client.followers(@twitter_handle).take(batch_size)
    

    # You can only get mentions for the authenticated user, not any handle you pass to the client.
    # @mentions = @client.mentions_timeline.take(batch_size)
  end

  def new
    # Make sure to set your Twitter app's callback URL to:
    # http://127.0.0.1:3000/auth/twitter/callback

    # puts @client.update("I'm tweeting with my app!").inspect

    render 'index'
  end


  # This is a sample of how you'd search for tweets via a full API call URL
  # Retrieve latest tweet for @dhh

  # Go to OAuth tool in your app settings
  # Do a GET request to the following: 
  # https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=dhh&count=1
  # (API docs - https://dev.twitter.com/docs/api/1.1/get/statuses/user_timeline)
  # Copy the cURL signature
  # Paste into your command line
  # Copy the big response
  # Paste in to http://jsonviewer.net/index.php
  # Check it out

  private

    def create_client
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key = "PMiAyrY5cASMnmbd1tg"
        config.consumer_secret = "0TYRYg0hrWBsr1YZrEJvS5txfA9O9aWhkEqcRaVtoA"
        config.access_token = "178394859-cJlRaiQvqVusPAPjqC2Nn7r3Uc7wWsGua7sGHzs"
        config.access_token_secret = "3T8LCZTYXzuPLGzmWX1yRnKs1JFpfJLKemoo59Piyl8"
      end
  end

end

