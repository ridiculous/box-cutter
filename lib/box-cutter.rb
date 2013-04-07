if defined? Rails
  class Engine < Rails::Engine
  end
  require 'box-cutter/railtie'
end