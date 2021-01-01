# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pu_svg/version"

Gem::Specification.new do |spec|
  spec.name          = "pu_svg"
  spec.version       = PuSvg::VERSION
  spec.authors       = ["tanish-kr"]
  spec.email         = ["tora.1986.tatsu@gmail.com"]

  spec.summary       = "Markdown convert to PlantUML as SVG"
  spec.description   = "Markdown convert to PlantUML as SVG"
  spec.homepage      = "https://github.com/tanish-kr/pu_svg"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.5"

  if spec.respond_to?(:metadata)

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/tanish-kr/pu_svg"
    spec.metadata["changelog_uri"] = "https://github.com/tanish-kr/pu_svg/releases"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.7"
  spec.add_development_dependency "rubocop-rspec", "~> 2.1"
  spec.add_development_dependency "yard", "~> 0.9.26"

  spec.add_runtime_dependency "nokogiri", "~> 1.10", ">= 1.10.10"
end
