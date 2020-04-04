class Song
  property link : String?
  property file_path : String?
  property :title

  def initialize(@title : String)
  end

  def path
    "songs/#{title}.song"
  end

  def to_song_file
    "#{title}<>#{file_path}<>#{link}"
  end
end
