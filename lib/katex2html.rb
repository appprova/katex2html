require "katex2html/version"
require "katex2html/parser"
require "katex2html/render"

module Katex2HTML
  HTML_LATEX = %{
    <p>Sejam $ p(x) = a_3x^3 + a_2x^2 + a_1x = a_0 , a_3 \neq 0 , a_3 , a_2 , a_1 , a_0 \in \mathbb{R} $ e -3 raiz de $p(x)$ . Sabendo que o quociente da divisão de $p(x)$ por $d(x) = x+ 3 $ é o polinômio $q(x) = 2x^2 - 3x + 1 $ , considere as seguintes afirmações:</p>
    <p>
    I. O polinômio $$p(x)$$ tem 3  raízes inteiras.<br />
    II. A soma dos coeficientes de $p(x)$ é zero.<br />
    III. O resto da divisão de $p(x)$ pelo binômio $m(x) = x + 2$ é um número primo.
    </p>
    <p>É CORRETO afirmar que:</p>
  }

  def self.render(to_convert, renderer = :inline)
    send(renderer, to_convert)
  end

  def self.inline(html_body)
    Parser.new(html_body).parse
  end

  def self.pure(latex)
    Render.new(latex).render
  end
end
