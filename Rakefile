#!/usr/bin/env rake
require "bundler/gem_tasks"
 
require 'rake/testtask'
 
Rake::TestTask.new do |t|
  t.libs << 'lib/exotel'
  t.test_files = FileList['test/lib/exotel/*_test.rb']
  t.verbose = true
end
       
task :default => :test
