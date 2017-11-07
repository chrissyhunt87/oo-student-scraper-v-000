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
    students
  end

  def self.scrape_profile_page(profile_url)
    student_page = Nokogiri::HTML(open("#{profile_url}")).css(".vitals-container")
    student = {}
    social_links = student_page.css(".social-icon-container")
      social_links.each do |link|
        
      end
    
    
    # twitter = student_profile.css(".social-icon-container").css("a").first.attr("href")
    # linkedin = 
    # github =
    # blog =
    # profile_quote =
    # bio =
    binding.pry
  end

end
