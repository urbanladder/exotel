require 'httparty'

module Exotel
  class Client
    include HTTParty

    def initialize(sid,token)
      @auth = {:username => sid, :password => token}
      @resource = Resource.new
    end
  
    def method_missing(method, *args, &block)
      @resource.append(method, args[0])
      @opts = {:query => @resource.options, :basic_auth => @auth}
      if args.size > 0 && !method.to_s.eql?("post")
        execute("get")
      elsif method.to_s.match /\bget\b|\bpost\b/
        execute(method)
      else
        return self
      end
    end
  
    def execute(method)
      response = Response.construct self.class.send(method,@resource.url,@opts)
      @resource = Resource.new
      response
    end
  
  end
end
