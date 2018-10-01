
module Rulers
  class Application
    def get_controller_and_action(env)
      _, controller_name, action, __ = env['PATH_INFO'].split('/', 4)
      Controller
      controller_name = controller_name.capitalize + 'Controller'
      klass = Object.const_get(controller_name)
      [klass, action]
    end
  end
end
