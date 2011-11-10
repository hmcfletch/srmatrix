# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "srmatrix/version"

Gem::Specification.new do |s|
  s.name        = "srmatrix"
  s.version     = SRMatrix::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Les Fletcher"]
  s.email       = ["les.fletcher@gmail.com"]
  s.homepage    = "https://github.com/hmcfletch/srmatrix"
  s.summary     = %q{SciRuby's matrix package}
  s.description = %q{A matrix library for the SciRuby project. It includes both dense and sparse implementations.}

  # s.rubyforge_project = "srmatrix"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
