require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      klass, action = get_controller_and_action(env)
      [
        200,
        {'Content-Type' => 'text/html'},
        [klass.new(env).send(action)]
      ]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end
  end
end
