require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = 'https://cryptojobslist.com/'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  jobs = Array.new
  job_listings = parsed_page.css('li.job.inline.featured')

  per_page = job_listings.count
  
  job_listings.each do |job_listing|
    job = {
      title: job_listing.css('a.jobTitle').text
    }
    jobs << job
  end
  byebug
end

scraper
