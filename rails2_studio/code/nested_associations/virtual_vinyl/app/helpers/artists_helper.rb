module ArtistsHelper
  
  # add 4 blank albums to the artist. This is a hack to allow forms with
  # children to have a place for new content
  def artist_with_blank_albums(artist)
    1.times { artist.albums.build }
    artist
  end
end