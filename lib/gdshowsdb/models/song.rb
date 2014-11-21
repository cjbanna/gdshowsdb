class Song < ActiveRecord::Base
	include Extensions::UUID
	
	belongs_to :show_set, :foreign_key => :show_set_uuid, :primary_key => :uuid
	belongs_to :song_ref, :foreign_key => :song_ref_uuid, :primary_key => :uuid
	
	attr_accessible :uuid, :show_set, :position, :segued

  def self.find_all_by_year(year)
    Song.joins(:show_set => [:show]).where('shows.year = ?', year)
  end
end