require "execjs"

module Katex2HTML
  class Renderer
    def initialize(_options = {})
    end

    def render(latex)
      context.call("katex.renderToString", latex)
    end

    private

    def context
      @context ||= ExecJS.compile(source)
    end

    def source
      @source ||= File.read(File.expand_path('../../../vendor/katex.min.js', __FILE__))
    end
  end
end
