module BoxCutter
  module BoxHelpers
    def box(options, &block)
      options = {
          title: '',
          if: true,
          span: nil,
          class: nil,
          color: nil,
          offset: nil,
          padding: 20,
          links: [],
          my_block: capture(&block)
      }.merge(options)

      options[:span].insert(0, 'span') if options[:span]
      options[:offset].insert(0, 'offset') if options[:offset]
      options[:color].insert(0, 'box-') if options[:color]
      options[:links] = [options[:links]] if options[:links] && !options[:links][0].is_a?(Array)
      options[:klass] = options.delete(:class)

      if options.delete(:if)
        render(partial: 'box-cutter/box', locals: options)
      end
    end
  end
end