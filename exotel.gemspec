# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exotel/version'

Gem::Specification.new do |spec|
  spec.name          = "exotel"
  spec.version       = Exotel::VERSION
  spec.authors       = ["anshul"]
  spec.email         = ["anshul@urbanladder.com", "anshl.goyl@gmail.com"]
  spec.description   = %q{Gem for using exotel api}
  spec.summary       = %q{The current version supports sending of an sms via the api, and querying for status of the sms}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
