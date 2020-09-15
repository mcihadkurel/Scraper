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
    job_lists = @document.css('li.job.inline.featured')
    i = 1
    job_lists.each do |j|
      job = {
        title: j.css('a.jobTitle').text,
        companyname: j.css('a.companyName').text,
        location: j.css('span.jobLocation').text,
        application: j.css('span.applications').text
      }
      job.each { |key, value| puts "#{key.capitalize} : #{value.capitalize}" }
      i += 1
      jobs << job
    end
    jobs.count
  end
end

scrapping = Scraper.new('https://cryptojobslist.com/', @doc, @document)
scrapping.web_scraper
