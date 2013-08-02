# Box::Cutter

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'box-cutter', git: 'https://github.com/ridiculous/box-cutter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install box-cutter

## Usage

No bootstrap required, just add the styesheet to application.css:
    
    require box-cutter
    
Now your ready to use it in your views:

    <%= box(title: 'Welcome') do %>
        # ...
    <% end %>
    
Options:

    title: '',   # Title for the box
    if: true,    # Conditionally show the box
    span: nil,   # N/A unless you include Twitter Bootstraps .span* classes
    class: nil,  # Custom CSS classes
    color: nil,  # We have purple, dark-purple, green, dark-green, white, blue, dark-blue, red, dark-red
    offset: nil, # 
    padding: 20, # Padding for box
    links: []    # Array of arrays: [['Home', root_path], ['Logout', logout_path]]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
