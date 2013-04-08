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

      options[:color].insert(0, 'box-') if options[:color]
      options[:offset] = "offset#{options[:offset]}" if options[:offset]
      options[:span] = "span#{options[:span]}" if options[:span]
      options[:links] = [options[:links]] if options[:links].any? && !options[:links][0].is_a?(Array)
      options[:klass] = options.delete(:class)

      if options.delete(:if)
        render(partial: 'box-cutter/box', locals: options)
      end
    end
  end
end