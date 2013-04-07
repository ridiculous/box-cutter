module BoxCutter
  module BoxHelpers
    def box(options = {}, &block)
      raise LocalJumpError, 'Block required' unless block_given?
      options = {header: '', padding: 20}.merge(options)
      options[:header] = {text: options[:header]} unless options[:header].is_a? Hash
      options[:header][:extra] = options.delete(:extra)
      options[:klass] = options.delete(:class) if options[:class]
      unless options.has_key?(:if) and not options.delete(:if)
        render(partial: 'box-cutter/box', locals: options.merge(my_block: capture(&block)))
      end
    end

    # Bootstrap icon helper
    # Usage: i("icon-user") or i(:user)
    # Output: <i class="icon-user"></i>
    def i(type, options = {})
      options = {label: nil, caret: nil, title: nil, class: nil}.merge(options)

      if type.is_a? Symbol
        type = case type
                 when :user
                   'icon-user'
                 when :edit
                   'icon-pencil'
                 when :show, :view
                   'icon-eye-open'
                 when :delete, :destroy, :remove
                   'icon-remove'
                 when :verified, :'green-check', :checked, :accepted
                   '/assets/icons/iconic/green/check_alt_16x16.png'
                 when :submitted
                   '/assets/icons/iconic/gray_light/check_alt_16x16.png'
                 when :rejected
                   '/assets/icons/iconic/red/x_alt_16x16.png'
                 when :unverified, :not_checked, :unchecked, :not_submitted
                   '/assets/icons/iconic/gray_light/lighter-check_alt_16x16.png'
                 else
                   raise 'Invalid Icon'
               end
      end

      # Add hooks for bootstrap tooltip if tip given
      options.merge!(title: options[:tip], class: "tip-top #{options[:class]}".compact) if options[:tip]

      # Text label and optional caret
      label = options.delete(:label)
      caret = options.delete(:caret)

      # Auto determine whether to use Bootstrap icons or normal image icons
      if type =~ /^icon/
        options[:class] = "#{type} #{options[:class]}".compact
        "#{content_tag(:i, nil, options.permit(:title, :class, :style))} #{label} #{content_tag(:span, nil, class: 'caret') if caret}".compact.html_safe
      else
        "#{image_tag(type, options.permit(:title, :class))} #{label}".compact.html_safe
      end
    end

    # Bootstrap icon helper for white icons
    def iw(type, options = {})
      i("#{type} icon-white", options)
    end
  end
end