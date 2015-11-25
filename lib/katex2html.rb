require "katex2html/version"
require "katex2html/render"
require "katex2html/katex_js"
require "katex2html/katex_js/base"
require "katex2html/katex_js/render"
require "katex2html/katex_js/auto_render"

module Katex2HTML
  def self.render(to_convert, renderer = :inline)
    send(renderer, to_convert)
  end

  def self.inline(html_body)
    KatexJS::AutoRender.new(html_body).render
  end

  def self.pure(latex)
    KatexJS::Render.new(latex).render
  end
end
