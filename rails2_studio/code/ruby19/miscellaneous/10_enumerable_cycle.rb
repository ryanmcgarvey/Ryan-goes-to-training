# Enumerable#cycle
people = ["Me", "You", "Them", "Him", "Her"]
css_styles = ['odd', 'even'].cycle
people.each do |person|
  puts "<li class='#{css_styles.next}'>#{person}</li>"
end
#<li class='odd'>Me</li>
# <li class='even'>You</li>
# <li class='odd'>Them</li>
# <li class='even'>Him</li>
# <li class='odd'>Her</li>
