class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  def self.create
    @@all << self.new
    @@all[-1]
  end
  def self.new_by_name(name)
    @@all << self.new
    @@all[-1].name = name 
    @@all[-1]
  end
  def self.create_by_name(name)
    @@all << self.new
    @@all[-1].name = name 
    @@all[-1]
  end
  def save
    self.class.all << self
  end
  def self.new_from_filename(filename)
    @@all << self.new
    @@all[-1].name, @@all[-1].artist_name = filename.split(" - ")[1].split(".")[0], filename.split(" - ")[0]
    @@all[-1]
  end
  def self.create_from_filename(filename)
    @@all << self.new
    @@all[-1].name, @@all[-1].artist_name = filename.split(" - ")[1].split(".")[0], filename.split(" - ")[0]
    @@all[-1]
  end
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  def self.destroy_all
    @@all = []
  end
end
