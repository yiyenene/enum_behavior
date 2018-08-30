
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "enum_behavior/version"

Gem::Specification.new do |spec|
  spec.name          = "enum_behavior"
  spec.version       = EnumBehavior::VERSION
  spec.authors       = ["yiyenene"]
  spec.email         = ["goodbyeboredworld@aol.jp"]

  spec.summary       = "Simple Polymorphic Behavior with Enum Related Object and Delegation."
  spec.homepage      = "https://github.com/yiyenene/enum_behavior"
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "> 4.1"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sqlite3", "~> 1.0"
  spec.required_ruby_version = ">= 2.1"
end
