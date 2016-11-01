require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end
      # Chapter2 Exercise3
      if env['PATH_INFO'] == '/'
        # env['PATH_INFO'] = '/quotes/a_quote'
        # Chapter2 Exercise3 Answer0

        # Chapter2 Exercise3 Answer1
        # return [200, {'Content-Type' => 'text/html'}, [File.read(File.expand_path("index.html"))]]

        # Chapter2 Exercise3 Answer2
        # controller = HomeController.new(env)
        # text = controller.send("index")
        # return [200, {'Content-Type' => 'text/html'}, [text]]

        # Chapter2 Exercise3 Answer3
        return ['302', { 'Content-Type' => 'text/html', 'Location' => "/quotes/a_quote" }, ["302 you've redirected"]]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
      rescue => e
        return [404, {'Content-Type' => 'text/html'}, [File.read(File.expand_path("404.html"))]]
      end
      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end

  # Chapter2 Exercise3 Answer2
  # class HomeController < Controller
  #   def index
  #     "Home Page"
  #   end
  # end
end