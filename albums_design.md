# Albums Model and Repository Classes Design Recipe

## 1. Design and create the Table

## 2. Create Test SQL seeds

## 3. Define the class names

```ruby

class Artist
end

class ArtistRepository
end


class Album
end

class AlbumRepository
end
```

## 4. Implement the Model class


## 5. Define the Repository Class interface

```ruby

class ArtistRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists;

    # Returns an array of Artist objects.
  end

end

class AlbumRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, release_year, artist_id FROM albums;

    # Returns an array of Album objects.
  end

  def find(id)
    # SELECT id, name, release_year, artist_id FROM albums WHERE id = $1;
  end
  
end
```

## 6. Write Test Examples

```ruby

# 1

repo = ArtistRepository.new

artists = repo.all

artists.length # =>  2

artists[0].id # =>  1
artists[0].name # =>  'Pixies'
artists[0].genre # =>  'Rock'

artists[1].id # =>  2
artists[1].name # =>  'ABBA'
artists[1].genre # =>  'Pop'

# 2

repo = AlbumRepository.new

albums = repo.all

albums.length # =>  2

albums[0].id # =>  1
albums[0].name # =>  'Bossanova'
albums[0].release_year # =>  '1999'
albums[0].artist_id # => '1'

albums[1].id # =>  2
albums[1].name # =>  'Surfer Rosa'
albums[1].release_year # =>  '2001'
albums[1].artist_id # => '1'

# 3
# Get a single album("Bossanova")

repo = AlbumRepository.new
album = repo.find(1)

album.title # => "Bossanova"
album.release_year # => "1999"
album.artist_id # => "1"

# 4
# Get a single album("Surfer Rosa")

repo = AlbumRepository.new
album = repo.find(2)

album.title # => "Surfer Rosa"
album.release_year # => "2001"
album.artist_id # => "1"

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

```ruby



def reset_artists_table
  seed_sql = File.read('spec/seeds_artists.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'artists' })
  connection.exec(seed_sql)
end

describe ArtistRepository do
  before(:each) do 
    reset_artists_table
  end

  # (your tests will go here).
end

def reset_albums_end
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'albums' })
  connection.exec(seed_sql)
end

describe AlbumRepository do
  before(:each) do 
    reset_albums_end
  end

  # (your tests will go here).
end

```

## 8. Test-drive and implement the Repository class behaviour


