require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      case env['PATH_INFO']
      when '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      when '/'
        # env['PATH_INFO'] = '/quote/show'
        return [
          200,
          {'Content-Type' => 'text/html'},
          [`cat ./public/index.html`]
        ]
      when '/redirect'
        return [
          301,
          {'Location' => '/quote/show'},
          []
        ]
      end

      klass, action = get_controller_and_action(env)
      [
        200,
        {'Content-Type' => 'text/html'},
        [klass.new(env).send(action)]
      ]
    # rescue
    #   [
    #     500,
    #     {'Content-Type' => 'text/html'},
    #     ['Internal error']
    #   ]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end
  end
end
