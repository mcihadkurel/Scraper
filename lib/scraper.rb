require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
    url = "https://cryptojobslist.com/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    hostel_lists = parsed_page.css('div.property-card')
    hostel_lists.each do |hostel_list|
        hostel = {

        }
    end
    byebug
end

scraper