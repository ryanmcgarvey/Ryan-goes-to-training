# Hash#select Returns a Hash (Hurrah!)
{chad: "Chad", 
 dave: "Dave", 
 mike: "Mike"}.select do |k,v| 
    v =~ /a/
end
#=> {:chad=>"Chad", :dave=>"Dave"}