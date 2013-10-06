require 'open-uri'
require 'nokogiri'

class Story

  attr_accessor :title, :url, :text

  def initialize(title="No Title Found", url)
    @title = title
    @url = url
    # self.get_text
  end

  def scrape
    @story_doc ||= Nokogiri::HTML(open(self.url))
  end

  def get_text
    scrape
    @story_doc.css('.article')
    #binding.pry
    # text = @mac_rumors_doc.css('.article .title a').each do |story|
    #   title = story.children.text
    #   url = story.attr("href")
    #   rumor = Story.new(title, url)
    #   self.stories << rumor
    # end 
  end

end