# UNIX people need to act like Windows people
# when reading and writing binary files:
#                      | (binary mode)
#                      v
File.open("/bin/ps", "rb") do |f|
  File.open("/tmp/ps-copy", "wb"){|out| out.write(f.read)}
  puts `chmod +x /tmp/ps-copy && /tmp/ps-copy`
end
#   PID TTY           TIME CMD
# 26222 ttys000    0:00.00 -bash
# 42916 ttys000    0:00.00 /usr/local/bin/ruby19 /usr/local/bin/irb19
# 42917 ttys000    0:00.00 sh -c chmod +x /tmp/ps-copy && /tmp/ps-copy
# 42919 ttys000    0:00.00 /tmp/ps-copy
# 26194 ttys001    0:00.00 -bash
# 42462 ttys003    0:00.00 -bash
# => nil
