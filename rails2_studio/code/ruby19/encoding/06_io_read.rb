# Default external encoding
data = File.open("/etc/passwd").read
puts data.encoding.name # => "UTF-8"
                                            
# Can be overridden
data = File.open("/etc/passwd", "r:us-ascii").read
puts data.encoding.name # => "US-ASCII"
