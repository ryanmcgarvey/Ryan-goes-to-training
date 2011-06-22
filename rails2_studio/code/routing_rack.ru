class Hello
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["Hello Rack!"]]
  end
end

class Router
  def call(env)
    case env['PATH_INFO']
    when /hello/
      Hello.new.call(env)
    else
      [200, {"Content-Type" => "text/html"}, [env['PATH_INFO']]]
    end
  end
end
run Router.new
