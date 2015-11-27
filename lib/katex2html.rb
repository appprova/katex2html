require "katex2html/version"
require "katex2html/parser"
require "katex2html/renderer"

module Katex2HTML
  def self.render(to_convert, options = {})
    options = default_opts.merge(options)
    send("render_#{options[:renderer]}", to_convert, options)
  end

  private
  def self.default_opts
    {
      renderer: :single
    }
  end

  def self.render_html(html_body, _options)
    Parser.new(html_body).parse
  end

  def self.render_single(latex, _options)
    Renderer.new.render(latex)
  end
end
