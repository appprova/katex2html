require "execjs"

module Katex2HTML
  class Render
    def initialize
    end

    def render(latex)
      context.call("katex.renderToString", latex)
    end

    private

    # def clean_latex(latex)
      # latex.gsub("\n", ' ')
    # end

    def context
      @context ||= ExecJS.compile(source)
    end

    def source
      @source ||= File.read(File.join([Dir.pwd, 'vendor', 'katex.min.js']))
    end
  end
end
