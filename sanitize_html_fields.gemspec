# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sanitize_html_fields/version'

Gem::Specification.new do |spec|
  spec.name          = "sanitize_html_fields"
  spec.version       = SanitizeHtmlFields::VERSION
  spec.authors       = ["Kai Straßmann"]
  spec.email         = ["derkai@gmail.com"]

  spec.summary       = "This is a tiny gem that sanitizes html when a record is saved."
  spec.homepage      = "https://github.com/cbot/sanitize_html_fields"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency("activerecord", [">= 4.0"])
  spec.add_dependency("actionview", [">= 4.0"])
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
