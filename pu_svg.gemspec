
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pu_svg/version"

Gem::Specification.new do |spec|
  spec.name          = "pu_svg"
  spec.version       = PuSvg::VERSION
  spec.authors       = ["tanish-kr"]
  spec.email         = ["tora.1986.tatsu@gmail.com"]

  spec.summary       = %q{Markdown convert to PlantUML as SVG}
  spec.description   = %q{Markdown convert to PlantUML as SVG}
  spec.homepage      = "https://github.com/tanish-kr/pu_svg"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/tanish-kr/pu_svg"
    spec.metadata["changelog_uri"] = "https://github.com/tanish-kr/pu_svg/releases"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'rubocop', '~> 1.7'
  spec.add_development_dependency 'pry', '~> 0.13.1'
  spec.add_development_dependency 'simplecov', '~> 0.20.0'

  spec.add_runtime_dependency "nokogiri", '~> 1.10', '>= 1.10.10'
end
