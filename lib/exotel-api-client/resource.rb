module Exotel
  class Resource
    BASE_URL = "https://twilix.exotel.in/" + "v1/Accounts/" + "%s/%s"
    attr_reader :options

    def initialize
      @keys = []
      @options = {}
    end

    def append(key, options)
      @keys << key
      @options.merge!(options) if options
    end

    def url(sid)
      @url = BASE_URL % [sid, @keys.join("/")]
    end
  end
end
