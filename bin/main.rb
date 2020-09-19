# !/usr/bin/env ruby

require 'csv'
require_relative '../lib/scraper.rb'

Scraper.new('https://cryptojobslist.com/', @unparse, @parsed_page).scrape
