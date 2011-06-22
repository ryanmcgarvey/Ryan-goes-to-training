 def pig(word)
    leadingCap = word =~ /^A-Z/
    word.downcase!
    res = case word
      when /^aeiouy/
        word+"way"
      when /^([^aeiouy]+)(.*)/
        $2+$1+"ay"
      else
        word
    end
    leadingCap ? res.capitalize : res
  end
