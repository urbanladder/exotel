lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exotel/version'

Gem::Specification.new do |s|
  s.name = "exotel"
  s.version = Exotel::VERSION
  s.authors = "Kumar Akarsh"
  s.email = ["akarsh@urbanladder.com","akarsh1357@gmail.com"]
  s.description = "A simple library for using the Exotel REST API"
  s.summary = "A simple library for using the Exotel REST API"
  s.homepage = "https://github.com/urbanladder/exotel"
  s.license = "MIT"

  s.files = `git ls-files`.split($/)
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"

  s.add_dependency 'httparty'
end
