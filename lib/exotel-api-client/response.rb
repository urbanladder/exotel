module Exotel
  class Response
    attr_reader :errors

    def initialize(hash)
      hash.each do |key,value|
        Response.new value if value.class == Hash
        self.instance_variable_set("@#{key}", value)
        self.class.send(:define_method, key, proc{self.instance_variable_get("@#{key}")})
      end
    end

    def self.construct(response)
      return response.class == Array ? response.collect { |item| Response.new(item) }  : Response.new(response)
    end

  end
end
