# Hashes now preserve order

# Ruby 1.8.6
{:x => 1, :y => 2, :z => 3}
# => {:z=>3, :x=>1, :y=>2}

# Ruby 1.9
{x: 1, y: 2, z: 3}
# => {:x=>1, :y=>2, :z=>3}

