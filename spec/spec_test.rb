require 'spec_helper'
require_relative '../bin/main.rb'

describe Scraper do
  describe '#web_scraper' do
    let(:scrap) { Scraper.new('https://cryptojobslist.com/', @doc, @document) }
    it 'when getting the joblist' do
      expect(scrap.web_scraper).to equal(29)
    end
  end
end
