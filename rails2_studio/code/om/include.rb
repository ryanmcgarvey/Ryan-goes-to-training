module Logger
  def log(msg)
    puts msg
  end
end

class Book
  include Logger
end

class Song
  include Logger
end
