filename = ARGV.shift || die("Missing filename")
output = filename + ".op"

File.open(output, "w:iso-8859-1") do |op| 
  File.open(filename, "r:utf-8") do |ip|
    ip.each do |line|
      line = line.chomp.split(/,\s*/, 2).reverse.join(" ")
      line = line.encode("iso-8859-1", undef: :replace)
      op.puts line
    end
  end
end