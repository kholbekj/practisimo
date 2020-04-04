class Song
  property link : String?
  property file_path : String?
  property :title

  def self.load_all
    file_names = Dir.glob("songs/*.song")
    file_names.map do |name|
      title, file_path, link = File.read(name).split("<>")
      song = self.new(title)
      song.link = link
      song.file_path = file_path
      song
    end
  end

  def initialize(@title : String)
  end

  def path
    "songs/#{title}.song"
  end

  def html_path
    "html/#{title}.html"
  end

  def to_song_file
    "#{title}<>#{file_path}<>#{link}"
  end

  def to_html
    <<-HTML
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <title>#{title}</title>
      </head>
      <body>
        <iframe width="560" height="315" src="#{link}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
        </iframe>
        <img src="#{file_path}"></img>
      </body>
    </html>
    HTML
  end
end
