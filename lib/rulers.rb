require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      klass, action = get_controller_and_action(env)
      [
        200,
        {'Content-Type' => 'text/html'},
        [klass.new(env).send(action)]
      ]
    rescue
      [
        500,
        {'Content-Type' => 'text/html'},
        ['Internal error']
      ]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end
  end
end
