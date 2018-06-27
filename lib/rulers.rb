require "rulers/version"
require 'rulers/array'

module Rulers
  class Application
    def call(env)
      system("echo debug > debug.txt")
      [
        200,
        {'Content-Type' => 'text/html'},
        ["Hello from Ruby on Rulers! #{[1,2,3].hello}"]
      ]
    end
  end
end
