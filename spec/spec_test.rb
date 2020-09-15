require 'spec_helper'
require_relative '../lib/scraper'

describe Scraper do
    describe '#web_scraper' do
        let(:scrap) { Scraper.new('https://cryptojobslist.com/', @doc, @document) }
        it 'when getting the joblist' do
            expect(scrap.web_scraper).to equal(29)
        end
    end
end