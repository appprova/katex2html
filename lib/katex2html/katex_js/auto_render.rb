module Katex2HTML
  class KatexJS::AutoRender < KatexJS::Base
    def render
      context.call("renderMathInElement", @latex)
    end

    private

    def source
      super + File.read(File.join([Dir.pwd, 'vendor', 'auto-render.min.js']))
    end
  end
end
