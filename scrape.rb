require 'pry'
require_relative 'lib/mac_rumors'
require_relative 'lib/story'

top_rumors = MacRumors.new
top_rumors.make_stories

loop do
  system("clear")
  top_rumors.stories.each_with_index do |story, i|
    if i + 1 < 10
      disp_i = " #{i+1}"
    else
      disp_i = "#{i+1}"
    end
    puts "#{disp_i}. #{story.title.slice(0,80)}"
  end

  input = gets.downcase.strip
  if input == 'exit'
    break
  elsif input.to_i.to_s == input
    input = input.to_i - 1
    system("open #{top_rumors.stories[input].url}")
  end
end