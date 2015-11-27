require 'spec_helper'

describe Katex2HTML::Renderer do
  let(:latex) { "log_{ab}" }
  let(:renderer) { Katex2HTML::Renderer.new }

  describe '#render' do
    context 'with valid arguments' do
      it 'renders latex formule into Katex HTML' do
        rendered = renderer.render(latex)

        expect(rendered).to_not eq(latex)
        expect(rendered).to include('katex')
      end
    end

    context 'with invalid arguments' do
      it 'raises ArgumentError when no latex is given' do
        expect { Katex2HTML::Renderer.new.render }.to raise_error(ArgumentError)
      end
    end
  end
end
