$LOAD_PATH.unshift(File.dirname(__FILE__)) # put ../lib in the path
require 'pathname'
module ScrapeSpeare
  DATA_DIR = Pathname.new File.expand_path( '../../data-hold', __FILE__)
  MIRROR_DIR = DATA_DIR.join('shakespeare.mit.edu')
  TEXT_DIR  = DATA_DIR.join('text')
  def self.build!
    scenes = ScrapeSpeare::Builder.gather_individual_play_scenes
    scenes.map!{|s| ScrapeSpeare::Builder.parse_scene(s)}

    build_dir_text!(scenes)
  end

  # builds text in this format:
  # | hamlet
  # |
  # |--- act-1
  #     |
  #     |------ scene-1.txt
  #     |------ scene-2.txt

  def self.build_dir_text!(scenes)
    scenes.each do |scene|
      fname = ScrapeSpeare::TEXT_DIR.join(scene[:play_slug], "act-#{scene[:act]}", "scene-#{scene[:scene]}.txt")
      FileUtils.mkdir_p(File.dirname(fname))
      open(fname, 'w') do |f|
        f.puts scene[:play_title]
        f.puts "ACT #{scene[:act]}, SCENE #{scene[:scene]}"
        f.puts scene[:scene_title]
        f.puts "------"
        current_speaker = nil
        scene[:lines].each do |line|
          if line[:type] ==  'speech'
            # new speaker adds a new line, and is indented
            if line[:speaker] != current_speaker
              f.puts "", "    #{line[:speaker]}:"
              current_speaker = line[:speaker]
            end
            f.puts line[:text]
          elsif line[:type] == 'direction'
            # stage directions are put in brackets
            f.puts "[#{line[:text]}]"
          end
        end
      end
    end
  end

# sudo apt-get install libopencv-dev
end


require 'scrapespeare/builder'
