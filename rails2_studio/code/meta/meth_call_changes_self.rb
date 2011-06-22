class Dave
  def return_self
    return self
  end
end

d = Dave.new

self            # => main
d.return_self   # => #<Dave:0x27a74>
self            # => main
