module InWords
  def in_words
    u_20 = {0=> "zero", 1=> "one", 2=> "two", 3=> "three", 4=> "four", 5=> "five", 6=> "six", 7=> "seven", 8=> "eight", 9=> "nine", 10=> "ten", 11=> "eleven", 12=> "twelve", 13=> "thirteen", 14=> "fourteen", 15=> "fifteen", 16=> "sixteen", 17=> "seventeen", 18=> "eighteen", 19=> "nineteen"}
    u_100 = {2=> "twenty", 3=> "thirty", 4=> "forty", 5=> "fifty", 6=> "sixty", 7=> "seventy", 8=> "eighty", 9=> "ninety"}
    o_1000 = {1=> "thousand", 2=> "million", 3=> "billion", 4=> "trillion"}
    mag = Math.log10(self).floor/3
    case self
    when 0...20
      u_20[self]
    when 20...100
      if self%10 == 0
        u_100[self/10.floor]
      else
        u_100[self/10.floor] + " " + u_20[self%10]
      end
    when 100...1000
      if self%100 == 0     
        u_20[self/100.floor] + " hundred"
      elsif self%100 < 20        
        u_20[self/100.floor] + " hundred " + u_20[self%100]
      else        
        u_20[self/100.floor] + " hundred " + (self%100).in_words
      end
    else
      if (self%10) == 0
        (self/10**(mag*3)).in_words + " " + o_1000[mag]
      else
        (self/10**(mag*3)).in_words  + " " + o_1000[mag] + " " + (self%10**(mag*3)).in_words
      end
    end    
  end  
end

class Fixnum
  include InWords
end
