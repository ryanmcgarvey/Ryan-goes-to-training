class PaidRegistration < Registration
  validates :paid_at, :presence => true, :past_date => true
end