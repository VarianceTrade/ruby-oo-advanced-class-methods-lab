class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize
  #   @song = song

  def self.create
    new_song = self.new
    new_song.save
    return new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    return new_song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.alphabetical
    @@all.sort_by do |song| song.name end
  end

  #
  # song_1 = Song.create_by_name("PYT")
  # song_2 = Song.create_by_name("Beat It") 
  # @@all = [Thriller, Beat It]
  # song_3 = Song.find_or_create_by_name("Thriller")
  # @all = [PYT, Beat It, Thriller]
  # song_4 = Song.find_or_create_by_name("Thriller")
  #
  #
  def self.find_or_create_by_name(name) # needs to be a loop (no duplicates)? - if..... song.new?
    song = self.find_by_name(name) # song = Thriller or song = nil if it can't find it
    if song # song is not nil / found old song with matching name
      return song
    else # song is nil / not found
      return self.create_by_name(name)
    end
  end                                       



  # Create a method new_by_name that takes in string. The method
  # creates a blank instance of Song, set the name to the string argument,
  # then return the instance.
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    return new_song
  end

  def self.new_from_filename(filename) # "Thundercat - For Love I Come.mp3"
    # 1. Parse filename string into song name and artist name
    regex = /([\w\-\s]+) - ([\w\s\-]+)\.mp3/

    ## run the regex against the filename string, store matches ina variable
    matches = filename.match(regex)

    ## create variables storing song name and artist from match data
    artist_name = matches[1]
    name = matches[2]

    # 2. Create a new song instance using the song data
    ## Create new blank song instance
    new_song = self.new

    ## Set new instance song name to name
    new_song.name = name

    ## Set new instance artist_name to artist_name
    new_song.artist_name = artist_name

    # 3. Return instance
    return new_song
  end

  def self.create_from_filename(filename)
    # 1. Use new from filename to create instance from filename
    new_song = self.new_from_filename(filename)

    # 2. Adds the new instance to @@all array
    new_song.save

    # 3. Return instance
    return new_song
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end


# song_1 = Song.create
# puts Song.all