class CatchAll
  def method_missing(method_name, *args, &block)
    puts "You called #{method_name} with #{args.inspect}"
  end
end

catcher = CatchAll.new
catcher.hello            # => You called hello with []
catcher.goodbye("mike")  # => You called goodbye with ["mike"]
catcher.sum(2, 4, 6)     # => You called sum with [2, 4, 6]