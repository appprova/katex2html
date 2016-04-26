require 'spec_helper'

describe Katex2HTML::Renderer do
  let(:valid_latex) { "log_{ab}" }
  let(:unsupported_latex) { "\\unsupportedcmd{ab}" }
  let(:invalid_latex) { "$log_{ab}$" }

  def renderer(options = {})
    Katex2HTML::Renderer.new(options)
  end

  describe '#render' do
    context 'with valid supported latex' do
      it 'renders latex formule into Katex HTML' do
        rendered = renderer.render(valid_latex)

        expect(rendered).to_not eq(valid_latex)
        expect(rendered).to include('katex')
      end
    end

    context 'with valid unsupported latex' do
      context "when renderer throwOnError option is true" do
        it 'raises ExecJS::ProgramError' do
          expect { renderer(throwOnError: true).render(unsupported_latex) }.to raise_error(ExecJS::ProgramError)
        end
      end

      context "when renderer throwOnError option is false" do
        it 'renders unsupported latex into Katex HTML' do
          rendered = renderer(throwOnError: false).render(unsupported_latex)

          expect(rendered).to_not eq(unsupported_latex)
          expect(rendered).to include('katex')
        end
      end
    end

    context 'with invalid latex' do
      it 'raises ExecJS::ProgramError' do
        expect { renderer(throwOnError: true).render(invalid_latex) }.to raise_error(ExecJS::ProgramError)
        expect { renderer(throwOnError: false).render(invalid_latex) }.to raise_error(ExecJS::ProgramError)
      end
    end

    context 'with invalid arguments' do
      it 'raises ArgumentError when no latex is given' do
        expect { Katex2HTML::Renderer.new.render }.to raise_error(ArgumentError)
      end
    end
  end
end
