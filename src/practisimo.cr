require "option_parser"
require "./song"

module Practisimo
  VERSION = "0.1.0"

  @@song : Song = Song.new("noop")

  if ARGV[0] == "create"
    exit unless ARGV[1]
    @@song = Song.new(ARGV[1])

    OptionParser.parse do |parser|
      parser.on "-f FILE", "--file-path=FILE", "Sheet music file path" do |file|
        @@song.file_path = file
      end

      parser.on "-y LINK", "--youtube-link=LINK", "Embed link to youtube" do |link|
        @@song.link = link
      end
    end
    File.write(@@song.path, @@song.to_song_file)
  elsif ARGV[0] == "generate"
    index = <<-HTML
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <title>Index!</title>
        <link rel="stylesheet" href="../css/style.css" />
        <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@400;700&family=Libre+Caslon+Display&display=swap" rel="stylesheet">
      </head>
      <body>
        <div class="title">
          <h1> Practisimo </h1>
        </div>
        <div class="song-list">
          <ul>
    HTML

    Song.load_all.each do |song|
      File.write(song.html_path, song.to_html)
      index += "<li><a href=\"#{song.html_name}\">#{song.title}</a>\n"
    end

    index += <<-HTML
          <ul>
        </div>
      </body>
    </html>
    HTML

    File.write("site/index.html", index)
  end
end
