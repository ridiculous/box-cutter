module BoxCutter
  module BoxHelpers
    class BoxOptions

      attr_reader :title, :if, :span, :klass, :color, :offset, :padding, :links

      def initialize(options={})
        @title = options[:title] || ''
        @if = options[:if] || 1
        @span = options[:span]
        @span.try(:prepend, 'span')
        @klass = options[:class]
        @color = options[:color]
        @color.try(:insert, 0, 'box-')
        @offset = options[:offset]
        @offset.try(:prepend, 'offset')
        @padding = options[:padding] || 20
        @links = options[:links]
        @links = @links ? !options[:links][0].is_a?(Array) ? [@links] : @links : []
      end
    end

    def box(options={}, &block)
      opts = BoxOptions.new(options)

      buffer = []
      if opts.if
        buffer << "<div class='#{opts.span}#{opts.offset}'><div>"
        buffer << "<div class='box #{opts.color}#{opts.klass}'>"
        if !opts.title.empty? || opts.links.any?
          buffer << "<div class='tab-header'>#{opts.title}<div class='pull-right tab-header-right'><div class='space-right actions'>"
          buffer << opts.links.map { |l| link_to(l[0], l[1], {class: 'ml5'}.merge(l[2] || {})) }
          buffer << '</div></div></div>'
        end
        if block_given?
          buffer << "<div class='box-content padded#{opts.padding}'>"
          buffer << capture(&block)
          buffer << '</div>'
        end
        buffer << '</div></div></div>'
      end
      buffer.flatten.join('').html_safe
    end
  end
end