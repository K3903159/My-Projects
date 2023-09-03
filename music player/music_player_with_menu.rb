require './input_functions'

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album
  attr_accessor :artist, :title, :date, :genre, :tracks, :album_number
    @@album_count = 0

  def initialize(artist, title, date, genre, tracks)
    @@album_count += 1
    @album_number = @@album_count
    @artist = artist
    @title = title
    @date = date
    @genre = genre
    @tracks = tracks
  end
end

class Track
  attr_accessor :name, :location, :track_number

  def initialize(name, location, track_number)
    @name = name
    @location = location
    @track_number = track_number
  end
end

def read_albums(music_file)
  album_count = music_file.gets().to_i()
  albums = []

  index = 0
  while (index < album_count)
    album = read_album(music_file)
    albums << album
    index += 1
  end

  return albums
end

def read_album(music_file)
  album_artist = music_file.gets()
  album_title = music_file.gets()
  album_date = music_file.gets()
  album_genre = music_file.gets()
  tracks = read_tracks(music_file)
  album = Album.new(album_artist, album_title, album_date, album_genre, tracks)

  return album
end

def read_track(music_file, track_number)
  trackname = music_file.gets()
  tracklocation = music_file.gets()
  track = Track.new(trackname, tracklocation, track_number)

  return track
end

def read_tracks(music_file)
  track_count = music_file.gets().to_i()
  tracks = []

  index = 0
  while index < track_count
    track = read_track(music_file, index + 1) # add 1 to index to get track number
    tracks << track
    index += 1
  end

  return tracks
end

def print_track(track)
  puts("#{track.track_number}. Track name: #{track.name}")
end

def print_tracks(tracks)
  x = 0
  while x < tracks.length
    print_track(tracks[x])
    x += 1
  end
end

def print_album(album)
  print("#{album.album_number}: ")
  print("Title: #{album.title}  ")
  print("Artist: #{album.artist}  ")
  print("Date: #{album.date}  ")
  print("Genre: #{$genre_names[album.genre.to_i]}\n")
end

def print_albums(albums)
  x = 0
  while (x < albums.length)
    print_album(albums[x])
    x += 1
  end
end


def display_albums_by_genre(albums)
  puts "1. Pop"
  puts "2. Classic"
  puts "3. Jazz"
  puts "4. Rock"
  genre_choice = read_integer_in_range("Pick a genre:", 1, 4)
  matching_albums = []
  i = 0
  while i < albums.length
    album = albums[i]
    if album.genre.to_i == genre_choice
      matching_albums << album
    end
    i += 1
  end 
    if matching_albums.empty?
      puts "No album found"
    else
      print_albums(matching_albums)
    end
end

def display_albums(albums)
	finished = false
	begin
		puts "1. Display all albums"
		puts "2. Display albums by genre"
		puts "3. Return to main menu"
		display_choice = read_integer_in_range("Select an option:", 1, 3)
		case display_choice
		when 1 
			print_albums(albums)
		when 2
			display_albums_by_genre(albums)
		when 3 
			finished = true
		else 
			puts "Please select an option"
		end 
	end until finished
end

def select_albums(albums)
  print_albums(albums)
  album_choice = read_integer_in_range("Select an Album number:", 1, albums.length)
  print_album(albums[album_choice-1])
  print_tracks(albums[album_choice-1].tracks)
  if albums[album_choice-1].tracks.empty?
    puts "No tracks found"
  else
    track_choice = read_integer_in_range("Select a track to play:", 1, albums[album_choice-1].tracks.length)
    puts "Playing track #{albums[album_choice-1].tracks[track_choice-1].name} from album #{albums[album_choice-1].title}"
  end
end

def main()
  finished = false
  albums_loaded = 0 # variable to keep track of number of albums loaded
  begin
    puts "Main Menu:"
    puts "1. Read in Albums"
    puts "2. Display Albums"
    puts "3. Select an Album to play"
    puts "4. Exit the application"
    menu_choice = read_integer_in_range("Please enter your choice:", 1, 4)
    case menu_choice
    when 1
      a_file = read_string("Enter a file path to an Album:")
      music_file = File.new(a_file, "r")
      albums = read_albums(music_file)
      music_file.close()
      albums_loaded = albums.length # set variable to number of albums loaded
      read_string("#{albums_loaded} albums loaded. Press enter to continue.")
    when 2
      display_albums(albums)
    when 3 
      select_albums(albums)
    when 4
      finished = true
    else 
      puts "Please select again"
    end
  end until finished
end
main()
