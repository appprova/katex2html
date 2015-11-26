require "katex2html/version"
require "katex2html/parser"
require "katex2html/render"

module Katex2HTML
  HTML_LATEX = "<p>Considere a, b e c números reais maiores que 1, tais que $log_{ba} = 2$ e $log_{bc} = 3$. O valor da expressão:</p><p>$log_c (a.c) + 3log_c b - 2log_c \\left(\\dfrac{a}{b}\\right)$ é:</p>"

  def self.render(to_convert, options)
    options = default_opts.merge(options)
    send(options.renderer, to_convert, options)
  end

  def self.html(html_body, options)
    Parser.new(html_body).parse
  end

  def self.single(latex, options)
    Render.new(latex).render
  end

  private
  def self.default_opts
    {
      renderer: :single
    }
  end
end
