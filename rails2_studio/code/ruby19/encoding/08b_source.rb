# encoding: utf-8
require 'mathn'
class Numeric
   def ℃
     (self - 32) * 5/9
   end
   def ℉
     self * 9/5 + 32
   end
end 

alias ✎ puts 
 
✎ 212.℃                 #=> 100
✎ 100.℉                 #=>  212