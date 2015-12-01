require 'spec_helper'

describe Katex2HTML::Renderer do
  let(:valid_latex) { "log_{ab}" }
  let(:invalid_latex) { "$log_{ab}$" }
  let(:renderer) { Katex2HTML::Renderer.new }

  describe '#render' do
    context 'with valid latex' do
      it 'renders latex formule into Katex HTML' do
        rendered = renderer.render(valid_latex)

        expect(rendered).to_not eq(valid_latex)
        expect(rendered).to include('katex')
      end
    end
    context 'with invalid latex' do
      it 'raises ExecJS::ProgramError' do
        expect { renderer.render(invalid_latex) }.to raise_error(ExecJS::ProgramError)
      end
    end

    context 'with invalid arguments' do
      it 'raises ArgumentError when no latex is given' do
        expect { Katex2HTML::Renderer.new.render }.to raise_error(ArgumentError)
      end
    end
  end
end
