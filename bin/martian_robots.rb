#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
Bundler.require
require 'optparse'
require './lib/input_parser'

options = {}
OptionParser.new do |opt|
  opt.on('--load file_name') { |o| options[:input_file_name] = o }
end.parse!

include InputParser
mars = parse_input(options[:input_file_name])
