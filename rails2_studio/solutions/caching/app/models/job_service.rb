class JobService
  attr_accessor :status
  def initialize
    @status = "O HI"
  end
  def self.find_by_job_id(*)
    new
  end
end
