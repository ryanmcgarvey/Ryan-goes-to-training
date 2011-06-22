log_line = %q(66.146.203.98 - - [17/Feb/2009:15:52:49 -0500] "GET /imag ... Firefox/3.0.6")

log_parser = %r{
  (?<ip>\S+){0}
  (?<blanks>\s-\s-\s){0}
  (?<timestamp>\[[^\]]+\]){0}
  \g<ip>\g<blanks>\g<timestamp>  
}x
p log_parser.match(log_line)[:timestamp]  #=> "[17/Feb/2009:15:52:49 -0500]"