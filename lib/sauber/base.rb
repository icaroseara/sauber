module Sauber
  class Base
    class << self
      def sanitize text 
        blacklist.each do |word|
         text.gsub!(word, replace(word))  unless whitelist.include?(word)
        end
        text
      end
      
      private
      def blacklist
        @blacklist ||= Sauber.blacklist
      end
      
      def whitelist
        @whitelist ||= Sauber.whitelist
      end
      
      def replace word       
        case Sauber.replacement
        when :stars
         '*' * word.length
        else
          word
        end
      end
    end 
  end
end