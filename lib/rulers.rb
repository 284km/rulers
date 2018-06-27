require "rulers/version"

module Rulers
  class Application
    def call(env)
      system("echo debug > debug.txt")
      [
        200,
        {'Content-Type' => 'text/html'},
        ["Hello from Ruby on Rulers!"]
      ]
    end
  end
end
