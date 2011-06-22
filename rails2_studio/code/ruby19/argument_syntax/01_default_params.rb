def lunch(spam=false, how_much)
  spam ? flunk("no thanks") : eat(how_much)
end
