require "katex2html/version"
require "katex2html/parser"
require "katex2html/render"

module Katex2HTML
  def self.render(to_convert, options = {})
    options = default_opts.merge(options)
    send(options[:renderer], to_convert, options)
  end

  def self.html(html_body, options)
    Parser.new(html_body).parse
  end

  def self.single(latex, options)
    Render.new.render(latex)
  end

  private
  def self.default_opts
    {
      renderer: :single
    }
  end
end
