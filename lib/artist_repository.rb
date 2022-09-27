require 'artist'

class ArtistRepository

    # Selecting all records
    # No arguments
    def all
      artists = []
      # Executes the SQL query:
      # SELECT id, name, genre FROM artists;
  
      # Returns an array of Artist objects.

      sql = 'SELECT id, name, genre FROM artists;'
      result_set = DatabaseConnection.exec_params(sql, [])
      result_set.each do |record|
        artist = Artist.new
        artist.id = record['id']
        artist.name = record['name']
        artist.genre = record['genre']
        artists << artist
      end
      return artists
    end
  
  end