module Addressable
  def tax
    self.state == "CO" ? BigDecimal.new("0.029") : BigDecimal.new("0.0")
  end
  
  def self.included(klass)
    klass.class_eval do
      validates :street, :city, :state, :zip, :country, :presence => true
    end
  end
end