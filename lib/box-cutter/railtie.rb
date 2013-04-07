require_relative 'helpers/box_helpers'

module BoxCutter
  class Railtie < Rails::Railtie
    initializer "helpers.box_helpers" do |app|
      ActionView::Base.send :include, BoxHelpers
    end
  end
end