require 'album_repository'

RSpec.describe AlbumRepository do
  def reset_albums_end
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
      
  before(:each) do 
    reset_albums_end
  end
      
  it 'returns a list of all Album objects' do
    repo = AlbumRepository.new

    albums = repo.all
    
    expect(albums.length).to eq 2
    
    expect(albums[0].id).to eq "1"
    expect(albums[0].title).to eq "Bossanova"
    expect(albums[0].release_year).to eq "1999"
    expect(albums[0].artist_id).to eq "1"
    
    expect(albums[1].id).to eq "2"
    expect(albums[1].title).to eq "Surfer Rosa"
    expect(albums[1].release_year).to eq "2001"
    expect(albums[1].artist_id).to eq "1"
  end

  it 'returns a single album("Bossanova")' do
    repo = AlbumRepository.new
    album = repo.find(1)
      
    expect(album.title).to eq "Bossanova"
    expect(album.release_year).to eq "1999"
    expect(album.artist_id).to eq "1"
  end

  it 'returns a single album("Surfer Rosa")' do
    repo = AlbumRepository.new
    album = repo.find(2)
      
    expect(album.title).to eq "Surfer Rosa"
    expect(album.release_year).to eq "2001"
    expect(album.artist_id).to eq "1"
  end

  it 'adds a new album to the repository' do
    repo = AlbumRepository.new
    
    new_album = Album.new
    new_album.title = 'Trompe le Monde'
    new_album.release_year = 1991
    new_album.artist_id = 1

    repo.create(new_album)

    all_albums = repo.all

    expect(all_albums).to include(
      have_attributes(
        title: new_album.title, 
        release_year: "1991",
        artist_id: "1"
      )
    )
  
  end
end