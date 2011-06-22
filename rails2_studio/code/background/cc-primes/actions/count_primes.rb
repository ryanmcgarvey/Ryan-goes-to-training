require 'prime'


class CountPrimes < CloudCrowd::Action  
  
  def split
    workers = (options['workers'] || 4).to_i
    @from, @to = split_input
    STDERR.puts input.inspect
    range = @to + 1 - @from
    offset = range / workers
    start = @from
    work = []
    (workers-1).times do
      work << range(start, start+offset-1)
      start += offset
    end
    work << range(start, @to)
    work
  end
  
  
  def process
    @from, @to = split_input
    count = 0
    @from.upto(@to) do |number|
      count += 1 if number.prime?
    end
    count
  end
  
  def merge
    input.inject {|sum, count| sum + count }
  end                                                 

  def split_input
    input.split(/,/).map(&:to_i)
  end
    
  def range(*args)
    args.map(&:to_s) * ","
  end
    
end