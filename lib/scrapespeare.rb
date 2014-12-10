$LOAD_PATH.unshift(File.dirname(__FILE__)) # put ../lib in the path
require 'pathname'
module ScrapeSpeare
  DATA_DIR = Pathname.new File.expand_path( '../../data-hold', __FILE__)
  MIRROR_DIR = DATA_DIR.join('shakespeare.mit.edu')

  def self.build!
    scenes = ScrapeSpeare::Builder.gather_individual_play_scenes

    scenes.map{|s| ScrapeSpeare::Builder.parse_scene(s)}
  end
end


require 'scrapespeare/builder'
