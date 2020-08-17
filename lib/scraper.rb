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
    binding.pry
    # doc = Nokogiri::HTML(open(index_url))
  end

end
