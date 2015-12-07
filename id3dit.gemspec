# coding: UTF-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'id3dit/version'

Gem::Specification.new do |spec|
	spec.name          = 'id3dit'
	spec.version       = ID3dit::VERSION
	spec.date          = ID3dit::DATE
	spec.author        = 'Christian Mayer'
	spec.email         = 'christian@fox21.at'
	
	spec.summary       = %q{ID3 Tags Editor}
	spec.description   = %q{ID3 tags editor for the command line written in Ruby.}
	spec.homepage      = ID3dit::HOMEPAGE
	spec.license       = 'GPL-3.0'
	
	spec.files         = `git ls-files -z`.split("\x0").reject{ |f| f.match(%r{^(test|spec|features)/}) }
	spec.bindir        = 'bin'
	spec.executables   = ['id3dit']
	spec.require_paths = ['lib']
	spec.required_ruby_version = '>=2.2.0'
	
	spec.add_development_dependency 'bundler', '~>1.10'
	
	spec.add_dependency 'id3lib-ruby', '~>0.6'
	spec.add_dependency 'highline', '~>1.7'
	spec.add_dependency 'rainbow', '~>2.0'
end
