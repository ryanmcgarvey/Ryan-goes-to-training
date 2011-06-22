class JobsController < ApplicationController
  #START:explicit
  def run_job_explicit
    job = JobWrapper.new("Hello from the batch side!")
    Delayed::Job::enqueue(job)
    render :text => "Created delayed job!"
  end
  #END:explicit
   
  #START:implicit
  def run_job_implicit
    job = LongRunner.new("Run, Little Job, Run...")
    job.send_later :do_hard_work
    render :text => "Created delayed job!"
  end
  #END:implicit
end
