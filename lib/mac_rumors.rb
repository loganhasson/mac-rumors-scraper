require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './story'

class MacRumors

  attr_accessor :url, :stories

  MAIN_URL = "http://macrumors.com"

  def initialize
    @url = MAIN_URL
    @stories = []
  end

  def scrape
    @mac_rumors_doc ||= Nokogiri::HTML(open(self.url))
  end

  def make_stories
    scrape
    @mac_rumors_doc.css('.article .title a').each do |story|
      title = story.children.text
      url = story.attr("href")
      rumor = Story.new(title, url)
      self.stories << rumor
    end
  end

end