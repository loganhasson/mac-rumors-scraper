require_relative '../lib/mac_rumors'

describe MacRumors do

  let (:mac_rumors) {MacRumors.new}

  it "should have a url set to http://macrumors.com" do
    mac_rumors.url.should eq(MacRumors::MAIN_URL)
  end

  context "scrape" do

    it "should have a scrape method" do
      mac_rumors.should respond_to(:scrape)
    end

    it "should return a nokogiri object" do
      mac_rumors.scrape.should be_kind_of(Nokogiri::HTML::Document)
    end
 
  end

  context "make_stories" do

    it "should create new Story instances" do
      mac_rumors.make_stories
      mac_rumors.stories.size.should be > 0
    end

  end

end