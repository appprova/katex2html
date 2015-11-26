module Katex2HTML
  class Parser
    def initialize(html, options = {})
      @options = default_opts.merge(options)
      @html = html
      @render = Render.new
    end

    def parse
      each_regex do |regex, pre, pos|
        @html.gsub Regexp.new(regex, Regexp::MULTILINE) do |v|
          latex = v.gsub(pre, '').gsub(pos, '')
          @render.render(latex)
        end
      end
    end

    def each_regex
      @options[:regex].each do |rx|
        regex = "#{Regexp.escape(rx[0])}+(.*?)#{Regexp.escape(rx[1])}+"
        return yield(regex, rx[0], rx[1])
      end
    end

    private

    def default_opts
      {
        regex: [ ['$', '$'] ],
        process_escapes: true
      }
    end
  end
end
