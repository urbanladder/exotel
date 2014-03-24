module Exotel
  class Resource
    attr_reader :options

    def initialize
      @keys = []; @options = {}
    end

    def append(key,options)
      @keys << key;  @options.merge!(options) if options
    end

    def url sid
      @url = "https://twilix.exotel.in/" + "v1/Accounts/" + "#{sid}/" + @keys.join("/")
    end
  end
end
