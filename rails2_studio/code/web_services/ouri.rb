require 'open-uri'

site = ARGV.shift || fail("Usage: #{$0} <url>")
open(site) do |pragprog|
  home_page = pragprog.read
  matches = /<title>(?<title>[^<]+)<\/title>/.match(home_page)
  puts matches[:title]
end