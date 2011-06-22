# Named references
log_line = %q(66.146.203.98 - - [17/Feb/2009:15:52:49 -0500] "GET /images/tab_left.jpg HTTP/1.1" 200 756 "http://www.chadfowler.com/stylesheets/main.css" "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.6) Gecko/2009020911 Ubuntu/8.10 (intrepid) Firefox/3.0.6")
parser = /(?<ip>\S+)\s-\s-\s(?<timestamp>\[[^\]]+\])/ # etc.
p parser.match(log_line)[:timestamp]
# "[17/Feb/2009:15:52:49 -0500]"
