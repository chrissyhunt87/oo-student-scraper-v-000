require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  attr_accessor :name, :location, :profile_url

  def self.scrape_index_page(index_url)
    student_cards = Nokogiri::HTML(open("#{index_url}")).css(".student-card")
    students = []
    student_cards.each do |card|
      students << {
        :name => card.css(".student-name").text,
        :location => card.css(".student-location").text,
        :profile_url => card.css("a").attr("href").value
      }
    end
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
