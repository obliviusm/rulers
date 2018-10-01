require "rulers/version"

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

    def get_controller_and_action(env)
      _, controller_name, action, __ = env['PATH_INFO'].split('/', 4)
      Controller
      controller_name = controller_name.capitalize + 'Controller'
      klass = Object.const_get(controller_name)
      [klass, action]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end
  end
end
