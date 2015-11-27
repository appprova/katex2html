require 'spec_helper'

describe Katex2HTML::Parser do
  let(:html_with_latex) { "<p>$log_{ab}$ and $log_{bc}$</p>" }
  let(:html_without_latex) { "<p>only text</p>" }

  describe '#initialize' do
    it 'expects html param to initialize' do
      expect { Katex2HTML::Parser.new }.to raise_error(ArgumentError)
    end

    it 'sets attributes' do
      parser = Katex2HTML::Parser.new(html_with_latex)

      expect(parser.instance_variable_get('@html')).to eq(html_with_latex)
      expect(parser.instance_variable_get('@options')).to be_a(Hash)
      expect(parser.instance_variable_get('@render')).to be_a(Katex2HTML::Renderer)
    end
  end

  describe '#parse' do
    context 'when HTML has LaTeX' do
      it 'parses a HTML and replace LaTeX formules with Katex HTML' do
        parsed_html = Katex2HTML::Parser.new(html_with_latex).parse
        expect(parsed_html).to_not eq(html_with_latex)
        expect(parsed_html).to include('katex')
      end
    end
    context 'when HTML does not have Latex' do
      it 'parses a HTML and returns original file' do
        parsed_html = Katex2HTML::Parser.new(html_without_latex).parse
        expect(parsed_html).to eq(html_without_latex)
      end
    end
  end
end
