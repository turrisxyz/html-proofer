# frozen_string_literal: true

$LOAD_PATH.push(File.expand_path("lib", __dir__))
require "html_proofer/version"

Gem::Specification.new do |gem|
  gem.name          = "html-proofer"
  gem.version       = HTMLProofer::VERSION
  gem.authors       = ["Garen Torikian"]
  gem.email         = ["gjtorikian@gmail.com"]
  gem.description   = %(Test your rendered HTML files to make sure they're accurate.)
  gem.summary       = %(A set of tests to validate your HTML output. These tests check if your image references are legitimate, if they have alt tags, if your internal links are working, and so on. It's intended to be an all-in-one checker for your documentation output.)
  gem.homepage      = "https://github.com/gjtorikian/html-proofer"
  gem.license       = "MIT"
  all_files         = %x(git ls-files -z).split("\x0")
  gem.files         = all_files.grep(%r{^(bin|lib)/})
  gem.executables   = all_files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]
  gem.required_ruby_version = [">= 2.6.0", "< 4.0"]

  gem.metadata = {
    "funding_uri" => "https://github.com/sponsors/gjtorikian/",
    "rubygems_mfa_required" => "true",
  }

  gem.add_dependency("addressable",     "~> 2.3")
  gem.add_dependency("mercenary",       "~> 0.3")
  gem.add_dependency("nokogiri",        "~> 1.13")
  gem.add_dependency("parallel",        "~> 1.10")
  gem.add_dependency("rainbow",         "~> 3.0")
  gem.add_dependency("typhoeus",        "~> 1.3")
  gem.add_dependency("yell",            "~> 2.0")
  gem.add_dependency("zeitwerk",        "~> 2.5")

  gem.add_development_dependency("awesome_print")
  gem.add_development_dependency("debug") if "#{RbConfig::CONFIG["MAJOR"]}.#{RbConfig::CONFIG["MINOR"]}".to_f >= 3.1
  gem.add_development_dependency("rake")
  gem.add_development_dependency("redcarpet")
  gem.add_development_dependency("rspec", "~> 3.1")
  gem.add_development_dependency("rubocop")
  gem.add_development_dependency("rubocop-rspec")
  gem.add_development_dependency("rubocop-standard")
  gem.add_development_dependency("timecop", "~> 0.8")
  gem.add_development_dependency("vcr", "~> 2.9")
end
