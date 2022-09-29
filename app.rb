require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/album_repository'

DatabaseConnection.connect('music_library')

result = DatabaseConnection.exec_params('SELECT * FROM artists;', [])

result.each do |record|
 p record
end

artist_repository = ArtistRepository.new
album_repository = AlbumRepository.new

album = album_repository.find(3)

puts album.id
puts album.title
puts album.release_year
puts album.artist_id
