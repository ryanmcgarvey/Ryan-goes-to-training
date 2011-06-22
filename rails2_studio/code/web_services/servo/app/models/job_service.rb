class JobService
  def self.instance
    @instance ||= new(Job.new)
  end
  
  def self.find_by_job_id(job_id)
    instance[job_id]
  end
  
  def initialize(*jobs)
    @jobs = {}
    @current_job_id = 0
    jobs.each do |job|
      @jobs[@current_job_id += 1] = job
    end
  end
  
  def [](job_id)
    @jobs[job_id]
  end
end