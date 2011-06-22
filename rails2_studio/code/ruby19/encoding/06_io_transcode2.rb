input = File.open("/etc/passwd", "r:utf-8:us-ascii")
output = File.open("/tmp/japanese_passwd", "r:sjis:utf-8")

# Transcode from US-ASCII -> UTF-8, 
# then from UTF-8 -> Shift_JIS

output.puts input.read    
