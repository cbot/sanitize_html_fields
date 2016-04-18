# SanitizeHtmlFields

This is a tiny gem that sanitizes html when an instance of ActiveRecord is saved.

The gem automatically picks up all String columns of a model that have a corresponding `$name_html` column and sanitizes them using the standard Rails `ActionView::Helpers::SanitizeHelper#sanitize` method.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sanitize_html_fields'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sanitize_html_fields

## Usage
Just add sanitize_html_fields to one of your ActiveRecord model classes and you're ready to go!

```ruby
class MyModel < ActiveRecord::Base
  sanitize_html_fields
end
```

From now on SanitizeHtmlFields will automatically sanitize all of the model's String columns that have a corresponding `$name_html` column.

Let's say your model has a 'text' column whose contents you'd like to be sanitized. In this case you need another String column named text_html.

### Options
You can pass an options hash to sanitize_html_fields which is then used for the individual calls to `ActionView::Helpers::SanitizeHelper#sanitize`.

With an option hash you can for example allow certain tags or attributes using the `tags` and `attributes` key. See the documentation of [ActionView::Helpers::SanitizeHelper#sanitize](http://api.rubyonrails.org/classes/ActionView/Helpers/SanitizeHelper.html#method-i-sanitize) for more details.

You can also use the `convert_newlines` key in the options hash to configure whether or not to convert line breaks to `<br>` tags. The default value for this option is `false`.

The `remove_excessive_whitespaces` key is used to control if excessive whitespace characters (multiple spaces, linebreaks, tabs or newlines) should be removed. The default value for this option is `true`.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
