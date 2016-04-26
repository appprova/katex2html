# Katex2HTML

[![Gem Version](https://badge.fury.io/rb/katex2html.svg)](https://badge.fury.io/rb/katex2html) [![Build Status](https://travis-ci.org/appprova/katex2html.svg?branch=master)](https://travis-ci.org/appprova/katex2html) [![Code Climate](https://codeclimate.com/github/appprova/katex2html/badges/gpa.svg)](https://codeclimate.com/github/appprova/katex2html) [![Test Coverage](https://codeclimate.com/github/appprova/katex2html/badges/coverage.svg)](https://codeclimate.com/github/appprova/katex2html/coverage)

An easy way to convert LaTeX formules into [Katex](https://github.com/Khan/KaTeX) HTML using Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'katex2html'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install katex2html

## Usage

To render strings into Katex HTML rendered maths, just use the method below:

```ruby
Katex2HTML.render(string, options)
```

### Options

You can provide  options as the last argument to `Katex2HTML.render`. Available options are:

* `renderer` : `symbol`. If `:html` parse an HTML file looking for matching patterns, convert the math and return a HTML with Katex rendered `string`. If `:single` render a single formule and returns an Katex rendered HTML `string`. (default `:single`)
* `delimiters` : `array`. You can send an array with custom delimiters to customize the parser patterns. (default: `[ ['$', '$'], ['\\[', '\\]'] ]`)

#### Renderer

##### Single

To render a specific math formule, you can use:

```ruby
# Single formule
formule = "log_c (a.c) + 3log_c b - 2log_c \\left(\\dfrac{a}{b}\\right)"

Katex2HTML.render(formule, renderer: :single) # Returns Katex HTML rendered
```

##### HTML

To parse all latex from an HTML string, you can just:

```ruby
# HTML with formules between `$`
mathHtml = "<p>Math below:</p><p>$log_c (a.c) + 3log_c b - 2log_c \\left(\\dfrac{a}{b}\\right)$</p>"

Katex2HTML.render(latex_html, renderer: :html) # Returns HTML with Katex HTML rendered
```

#### Delimiters

You can send an array with custom delimiters

```ruby
# HTML with formules between `BOF` and `EOF`
mathHtml = "<p>Math below:</p><p>BOFlog_c (a.c) + 3log_c b - 2log_c \\left(\\dfrac{a}{b}\\right)EOF</p>"

Katex2HTML.render(latex_html, delimiters: ['BOF', 'EOF'], renderer: :html) # Returns HTML with Katex HTML rendered
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/appprova/katex2html. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
