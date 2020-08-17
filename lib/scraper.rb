require 'open-uri'
require 'pry'
require 'json'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    students_data = doc.css(".student-card")
    students = []
    students_data.each do |s|
      students_hash = {}
      students_hash[:name] = s.css(".student-name").text
      students_hash[:location] = s.css(".student-location").text
      students_hash[:profile_url] = s.css("a").attr("href").value
      students << students_hash
    end
      students
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    profile_data = doc.css(".main-wrapper")
    scraped = []

    profile_data.each do |d|
      profile_hash = {}
      profile_hash[:name] = d.css(".profile-name").text
      profile_hash[:location] = d.css(".profile-location").text
      binding.pry

        d.css(".social-icon-container").attr("href").each do |l|
          binding.pry
          # case
          #   when l
        end
    end
      # profile_hash[:twitter] = d.css(".social-icon-container").attr("href")[0].value
      # profile_hash[:linkedin] = d.css(".social-icon-container").attr("href")[1].value
      # profile_hash[:github] = d.css(".social-icon-container").attr("href")[2].value
      # profile_hash[:name] = d.css(".profile-name").text
      # profile_hash[:name] = d.css(".profile-name").text

      # :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url


  end

end
