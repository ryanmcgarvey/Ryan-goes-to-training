class JobPoller < ActionController::Metal
  include ActionController::Rendering
  
  def index
    job = JobService.find_by_job_id(Integer(params["id"]))
    if job
      render :text => job.status
    else
      head 404
    end
  end
end
