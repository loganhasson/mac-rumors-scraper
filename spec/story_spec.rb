describe Story do

  let (:story) {Story.new}

  it "should have a title" do
    story.title = "This is a Rumor"
    story.title.should eq("This is a Rumor")
  end

  it "should have its title set by default" do
    story.title.should eq("No Title Found")
  end

end