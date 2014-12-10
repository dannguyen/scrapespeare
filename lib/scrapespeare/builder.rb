require 'nokogiri'
module ScrapeSpeare
  module Builder
    class << self


  def parse_scene(path)
        npage = parse_html(path)
        h = {path: path}
        h[:play_slug], h[:act], h[:scene] = File.basename(path, '.html').split('.').tap{|o| o[1] = o[1].to_i; o[2] = o[2].to_i}
        h[:play_title] = npage.search('table > tr > td.play')[0].children[0].text.strip
        h[:scene_title] = npage.search('h3').text.strip
        h[:lines] = []
        h[:lines] << {type: 'direction', text:  npage.search('blockquote')[0].text.strip }

        npage.search('blockquote')[0].xpath('following-sibling::*').inject(h[:lines]) do |arr, node|
          case node.name
          when 'a' # new speech
            current_speaker = node.text.strip
            current_speech_num = node.attr('name')[/\d+/].to_i
            h_speaker = {speaker: current_speaker, speech_number: current_speech_num }
            # next element is a blockquote
            node.next_element.search('a, p').each do |speech_line|
              h_line = h_speaker.merge(text: speech_line.text.strip)
              if speech_line.name == 'a' # regular speech
                h_line[:type] = 'speech'
                h_line[:speech_line_number] = speech_line.attr('name').to_i
              elsif speech_line.name == 'p' # stage direction
                h_line[:type] = 'direction'
              end

              arr << h_line
            end
          else
            # other elements, like table
          end

          arr
        end

        return h
      end




      def gather_individual_play_scenes
        Dir.glob(ScrapeSpeare::MIRROR_DIR.join('*/*.html')).
          reject{|f| f =~ /\/Poetry|\/Shakespeare|index.html|full.html/}
      end

      def gather_individual_poems
        Dir.glob(ScrapeSpeare::MIRROR_DIR.join('Poetry/*.html')).
          reject{|f| f =~ /sonnets.html/}
      end

      private
      def parse_html(path)
        # have to clean up the first unclosed <p> tag
        text = open(path){|f| f.read }
        text.sub!(/<p><blockquote>/, '<blockquote>')
        Nokogiri::HTML(text)
      end

    end
  end
end
