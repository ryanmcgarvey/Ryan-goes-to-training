#!/usr/bin/env ruby -rubygems

require 'restclient'
require 'json'


job = RestClient.post('http://localhost:9173/jobs', 
  {:job => {
            'action'  => 'count_primes',
            'inputs'  => [ "1_000_000,2_000_000" ],
            'options' => { 'workers' => 4}
  }.to_json}
)

job = JSON.load(job)

loop do
  job_status = JSON.load(RestClient.get("http://localhost:9173/jobs/#{job["id"]}"))
  case job_status["status"]
  when "failed"
    puts "JOB FAILED"
    break
  when "processing"
    puts %{Processing: workers completed = #{job_status["percent_complete"]}%}
  when "succeeded"
    puts "DONE: result = #{job_status['outputs'].join}" 
    puts "It took #{job_status['time_taken']}s"
    break
  end
  sleep 1
end

