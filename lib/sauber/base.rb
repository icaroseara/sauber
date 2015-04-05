module Sauber
  class Base
    class << self
      def clean text 
        return text if text.empty?
        text.split(/(\s)/).collect{ |w| clean_word(w) }.join
      end
      
      private
      
      def blacklist
        @blacklist ||= get_content Sauber.blacklist
      end
      
      def whitelist
        @whitelist ||= get_content Sauber.whitelist
      end
      
      def invalid? word
        blacklist.include?(word.downcase) && !whitelist.include?(word.downcase)
      end
      
      def replace word       
        case Sauber.replacement
        when :stars
         '*' * word.length
        else
          word
        end
      end
      
      def clean_word word
        return word unless word.strip.size > 2

        if word.index(/[\W]/)
          word = word.split(/(\W)/).collect{ |w| clean_word(w) }.join
          subword = word.gsub(/\W/, '')
          word = subword if invalid?(subword)
        end

        invalid?(word) ? replace(word) : word
      end
      
      def get_content list
        case list
        when Array then list
        when String, Pathname then YAML.load_file( list.to_s )
        else []
        end
      end
    end 
  end
end