require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
    url = "https://www.hostelworld.com/s?q=Izmir,%20Turkey&country=Turkey&city=Izmir&type=city&id=719&from=2020-09-14&to=2020-09-17&guests=2&page=1"
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