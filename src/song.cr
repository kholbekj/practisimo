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

  def html_name
    "#{title}.html"
  end

  def html_path
    "site/#{html_name}"
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
        <script src="https://cdn.plyr.io/3.5.10/plyr.js"></script>
        <link rel="stylesheet" href="https://cdn.plyr.io/3.5.10/plyr.css" />
        <link rel="stylesheet" href="../css/style.css" />
        <link href="https://fonts.googleapis.com/css2?family=Libre+Caslon+Display&display=swap" rel="stylesheet">
      </head>
      <body>
        <div class="title">
          <h1>#{title}</h1>
        </div>
        <div class="outer box"></div>
        <div class="inner box">
          <img src="#{file_path}"></img>
        </div>
        <div class="outer container box">
          <div id="player" data-plyr-provider="youtube" data-plyr-embed-id="#{link}"></div>
        </div>

        <div class="footer">
          <a href="index.html">Back to index!</a><br>
        </div>

        <script>
          const player = new Plyr('#player', {});
          window.player = player;
        </script>
      </body>
    </html>
    HTML
  end
end
