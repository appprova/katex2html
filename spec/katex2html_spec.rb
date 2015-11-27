require 'spec_helper'

describe Katex2HTML do
  describe '.render' do
    it 'responds to render' do
      expect(subject).to respond_to(:render)
    end

    context 'wihout options' do
      it 'render with single renderer' do
        expect(subject).to receive(:render_single)

        Katex2HTML.render("mylatex")
      end
    end

    context 'with options' do
      describe ':html' do
        it 'render with html renderer' do
          expect(subject).to receive(:render_html)

          Katex2HTML.render("mylatex", {renderer: :html})
        end
      end
      describe ':single' do
        it 'render with single renderer' do
          expect(subject).to receive(:render_single)

          Katex2HTML.render("mylatex", {renderer: :single})
        end
      end
      describe 'invalid option' do
        it 'raises MethodNotFound' do
          expect { Katex2HTML.render("mylatex", renderer: :invalid) }.to raise_error(NoMethodError)
        end
      end
    end
  end
end
