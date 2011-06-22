# Default external encoding
f = File.open("/etc/passwd")
puts f.external_encoding.name # => "UTF-8"                                             

# Can be overridden
f = File.open("/etc/passwd", "r:us-ascii")
puts f.external_encoding.name # => "US-ASCII"
