require "rulers/version"
require 'rulers/array'
require 'rulers/routing'
require 'rulers/util'
require 'rulers/dependencies'
require 'rulers/controller'
require 'rulers/file_model'

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      r = controller.get_response

      system("echo debug > debug.txt")

      if r
        [r.status, r.headers, [r.body].flatten]
      else
        [
          200,
          {'Content-Type' => 'text/html'},
          # ["Hello from Ruby on Rulers! #{[1,2,3].hello}"]
          [text]
        ]
      end
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
end
