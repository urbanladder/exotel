module Exotel
  class Resource
    attr_reader :options

    def initialize
      @keys = []; @options = {}
    end

    def append(key,options)
      @keys << key;  @options.merge!(options) if options
    end

    def url
      @url = "https://twilix.exotel.in/" + @keys.join("/")
    end
  end
end
