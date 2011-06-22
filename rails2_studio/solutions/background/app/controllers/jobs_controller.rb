class JobsController < ApplicationController
  def explicit
    job = JobWrapper.new("Hello from the batch side")
    Delayed::Job::enqueue(job)
  end
   
  def implicit
    job = LongRunner.new("run, little job, run...")
    job.send_later :do_something
  end
end
