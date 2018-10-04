require 'erubis'

template = <<TEMPLATE
  Hi
  My name is <%= RUBY_VERSION %>
TEMPLATE

eruby = Erubis::Eruby.new(template)
puts eruby.src
puts eruby.result(name: 'Vasia')
