class ConfirmedRegistration < Registration
  validates :confirmed_at, :presence => true, :past_date => true
  
  def paid!
    convert_to PaidRegistration, :paid_at
  end
end