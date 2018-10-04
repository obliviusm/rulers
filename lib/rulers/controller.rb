module Rulers
  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view_name, locals = {})
      path = File.join('app', 'views', view_name)
      template = File.read(path)
      eruby = Erubis::Eruby.new(template)
      eruby.result(locals.merge(env: env))
    end
  end
end
