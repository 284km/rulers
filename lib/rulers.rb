require "rulers/version"
require 'rulers/array'
require 'rulers/routing'

module Rulers
  class Application
    def call(env)
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)

      system("echo debug > debug.txt")
      [
        200,
        {'Content-Type' => 'text/html'},
        # ["Hello from Ruby on Rulers! #{[1,2,3].hello}"]
        [text]
      ]
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
