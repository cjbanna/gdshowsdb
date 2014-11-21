module Gdshowsdb
  class SongDBExtractor
    def self.from_db(year)      
      SongDBExtractor.new(Song.find_all_by_year(year))
    end    

    def initialize(songs)
      @songs = songs
    end

    def extract
      @songs.map do |song|
        song_map = song.attributes.convert_to_sym
        song_map[:name] = song.song_ref.name
        song_map.reject {|k,v| k == :song_ref_uuid }
      end
    end
  end
end