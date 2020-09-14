require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = 'https://cryptojobslist.com/'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  job_listings = parsed_page.css('li.job.inline.featured')
  job_listings.each do |job_listing|
    job = {
      location: job_listing.css('span.jobLocation').text
      title: job_listing.css('a.jobTitle').text
      company: job_listing.css('a.companyName').text
      application: job_listing.css('span.createdAt').text
    }
  end
                end
byebug

scraper
