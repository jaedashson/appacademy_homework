class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  # Should be similar to User#join_post_comment_counts
  def better_tracks_query
    # TODO: your code here
    albums_with_track_counts = self.albums
      .select("albums.*, COUNT(*) AS track_count")
      .joins(:tracks) # Album's has_many :tracks method
      .group("albums.id") # or "tracks.album_id"

    album_track_counts = {}

    albums_with_track_counts.map do |album|
      album_track_counts[album.title] = album.track_count
    end

    album_track_counts
  end
end
