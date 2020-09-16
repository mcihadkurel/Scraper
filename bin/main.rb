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

scrapping = Scraper.new('https://cryptojobslist.com/', @doc, @document)
scrapping.web_scraper
