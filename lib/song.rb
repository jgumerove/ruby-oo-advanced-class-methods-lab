class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    #@@all << song #note the use of self.all here self.all is the same as @@all
    song #note that you are explicity told to return teh song created at the end in the dircetions
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create #SAME AS creating an instance saving instance to @@all and then returning the instance/also note that the rspec tells you to use this and tells t save song
    song.name = title #can add properties and will still get saved
    song #note told in directions to return this at the end
  end

  def self.find_by_name(title)
    self.all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title) #can use because if one doesnt give a return other will/order matters
  end

  def self.alphabetical
    self.all.sort_by do |song| #remember spaceship operator 
      song.name #name is in the attr_accessor
    end
  end

  def self.new_from_filename(filename)
    song = self.new #same thing as doing Song.new
    file_array = filename.split(/[-.]/) #splitting based on a range of criteria 
    song.name = file_array[1].strip
    song.artist_name = file_array[0].strip
    song #pay attention to the word return in the instructions
  end

  def self.create_from_filename(filename)
    file_array = filename.split(/[-.]/)
    song = self.new
    song.name = file_array[1].strip
    song.artist_name = file_array[0].strip
    song.save #this will save the data above based on everything give/note how not told to return 
  end

  def self.destroy_all
    self.all.clear
  end

end
