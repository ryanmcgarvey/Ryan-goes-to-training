# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class Poller
  def self.call(env)
    if env["PATH_INFO"] =~ %r{^/job_status/([^/]+)}
      job = JobService.find_by_job_id(Integer($1))
      if job
        [200, {"Content-Type" => "text/plain"}, job.status]
      else
        [404, {"Content-Type" => "text/plain"}, ["Not Found"]]
      end
    end
  end
end
