exclamation = "ओ एम जीOMG!"
p exclamation.scan(/[A-Z]/)
# ["O", "M", "G"]
p exclamation.scan(/\p{Devanagari}/)
# ["ओ", "ए", "म", "ज", "ी"]
