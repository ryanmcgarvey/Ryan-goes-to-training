# transcode from US-ASCII -> UTF-8
f = File.open("/etc/passwd", "r:us-ascii:utf-8")
puts f.external_encoding.name  # => "US-ASCII"
puts f.internal_encoding.name  # => "UTF-8"
data = f.read
puts data.encoding.name # => "UTF-8"

# transcode from US-ASCII -> Shift_JIS
f = File.open("/etc/passwd", "r:us-ascii:sjis")
puts f.external_encoding.name  # => "US-ASCII"
puts f.internal_encoding.name  # => "Shift_JIS"
data = f.read
puts data.encoding.name # => "Shift_JIS"
