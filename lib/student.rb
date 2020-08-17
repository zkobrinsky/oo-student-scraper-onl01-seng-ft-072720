class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
    save
  end

  def save
    @@all << self
  end


  def self.create_from_collection(students_array)
    students_array.each {|o| Student.new(o)}
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def self.all
    @@all
  end
  # binding.pry
end
