require "execjs"

module Katex2HTML
  class KatexJS::Base
    def initialize(latex)
      @latex = latex
    end

    def render
      context.call("katex.renderToString", @latex)
    end

    private

    def context
      ExecJS.compile(source)
    end

    def source
      File.read(File.join([Dir.pwd, 'vendor', 'katex.min.js']))
    end
  end
end
