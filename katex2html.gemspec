# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'katex2html/version'

Gem::Specification.new do |spec|
  spec.name          = "katex2html"
  spec.version       = Katex2HTML::VERSION
  spec.authors       = ["João Fraga"]
  spec.email         = ["joaogabriel@appprova.com.br"]

  spec.summary       = %q{An easy way to convert LaTeX formules into Katex HTML using Ruby.}
  spec.homepage      = "https://github.com/appprova/katex2html"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "execjs", "~> 2.4.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "codeclimate-test-reporter"
end
