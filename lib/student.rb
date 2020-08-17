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
    binding.pry
    students_array.each.tap{|o| o = Student.new(self)}

  end

  def add_student_attributes(attributes_hash)

  end

  def self.all

  end
end
