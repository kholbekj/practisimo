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
    Song.load_all.each do |song|
      File.write(song.html_path, song.to_html)
    end
  end
end
