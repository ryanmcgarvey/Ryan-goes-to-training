# encoding: utf-8
puts __ENCODING__
require 'mathn'
class Numeric
   def ℃
     (self - 32) * 5/9
   end
   def ℉
     self * 9/5 + 32
   end
end
 
puts 212.℃
puts 100.℉
