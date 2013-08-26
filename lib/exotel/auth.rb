require 'httparty'

module Exotel
  class Auth

    include HTTParty
    base_uri "https://twilix.exotel.in"
    attr_accessor :sid, :token

    # <b>Expects</b>
    # * sid => your exotel sid 
    # * token => your exotel token 
    #
    def self.set_credentials(sid, token)
      @sid = sid
      @token = token
      basic_auth @sid, @token
    end

  end
end
