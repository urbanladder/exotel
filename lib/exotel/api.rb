require "httparty"

module Exotel
  class Api
    include HTTParty
    base_uri "https://twilix.exotel.in"

    class << self
      attr_reader :sid, :token

      def set_credentials(sid, token)
        @sid = sid
        @token = token
        basic_auth @sid, @token
      end

      def sendSMS(data)
        t = post("/v1/Accounts/%s/Sms/send" % [@sid],
                 {:body => data})
        puts t.inspect
      end
    end
  end
end
