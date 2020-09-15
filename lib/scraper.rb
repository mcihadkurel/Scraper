require 'nokogiri'
require 'open-uri'

class Scraper
  def initialize(url, _doc, _document)
    @url = url
    @doc = ::OpenURI.open_uri(url)
    @document = Nokogiri::HTML(@doc)
  end

  def web_scraper
    jobs = []
    jobLists = @document.css('li.job.inline.featured')
    jobLists.each do |jobList|
      job = {
        title= jobList.css('a.jobTitle').text
        companyname= jobList.css('a.companyName').text
        location= joblist.css('span.jobLocation').text
        application= joblist.css('span.applications').text
      job.each { |key, value| puts "#{key.capitalize} : #{value.capitalize}" }
      i += 1
      jobs << job
    end
    jobs.count
  end
end

scrapping = Scraper.new('https://cryptojobslist.com/', @doc, @document)
scrapping.web_scraper
