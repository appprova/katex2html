require "execjs"

module Katex2HTML
  class Renderer
    def initialize(options = {})
      @options = default_opts.merge(options)
    end

    def render(latex)
      context.call("katex.renderToString", latex, @options)
    end

    private

    def context
      @context ||= ExecJS.compile(source)
    end

    def source
      @source ||= File.read(File.expand_path("../../../vendor/katex.min.js", __FILE__))
    end

    def default_opts
      {
        displayMode: false,
        throwOnError: true,
        errorColor: '#cc0000'
      }
    end
  end
end
