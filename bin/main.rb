require 'nokogiri'
require 'open-uri'

class Scraper
  def initialize(url, _unparsed_page, _parsed_page)
    @url = url
    @unparsed_page = ::OpenURI.open_uri(url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
  end

  def web_scraper
    jobs = Array.new
    job_lists = @parsed_page.css('li.job.inline.featured')
    i = 1
    job_lists.each do |job_list|
      job = {
        title: job_list.css('a.jobTitle').text,
        companyname: job_list.css('a.companyName').text,
        location: job_list.css('span.jobLocation').text,
        application: job_list.css('span.applications').text
      }
      job.each { |key, value| puts "#{key.capitalize} : #{value.capitalize}" }
      i += 1
      jobs << job
    end
    jobs.count
  end
end

scrapping = Scraper.new('https://cryptojobslist.com/', @unparsed_page, @parsed_page)
scrapping.web_scraper
