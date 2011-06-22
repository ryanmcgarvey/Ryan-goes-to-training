class Address < Struct.new(:street, :city, :zip, :state)
  def to_s
    "#{self.street}\n#{self.city}, #{self.state} #{self.zip}"
  end
end

addy = Address.new("123 Main", "Springfield", "75123", "IL")

puts addy.to_s  # >> 123 Main
                # >> Springfield, IL 75123
