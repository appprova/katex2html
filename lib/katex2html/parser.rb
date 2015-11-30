module Katex2HTML
  class Parser
    def initialize(html, options = {})
      @options = default_opts.merge(options)
      @html = html
      @render = Renderer.new(options)
    end

    def parse
      each_delimiter do |regex, pre, pos|
        @html = @html.gsub Regexp.new(regex, Regexp::MULTILINE) do |match|
          latex = match.gsub(pre, '').gsub(pos, '')
          @render.render(latex)
        end
      end
    end

    private

    def each_delimiter
      parsed_html = ""
      @options[:delimiters].each do |rx|
        regex = "#{Regexp.escape(rx[0])}+(.*?)#{Regexp.escape(rx[1])}+"
        parsed_html = yield(regex, rx[0], rx[1])
      end
      parsed_html
    end

    def default_opts
      {
        delimiters: [ ['$', '$'], ['\\[', '\\]'] ],
        process_escapes: true
      }
    end
  end
end
