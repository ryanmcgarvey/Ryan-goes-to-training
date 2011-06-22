class HelloRack
  def self.call(env)
    [200, {}, "HELLO RACK!!!"]
  end
end
