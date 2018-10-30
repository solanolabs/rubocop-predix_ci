lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop/predix_ci/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubocop-predix_ci'
  spec.version       = RuboCop::PredixCi::VERSION
  spec.authors       = ['curious725']
  spec.email         = ['curious725@gmail.com']

  spec.summary       = 'Custom code style checking for Predix CI.'
  spec.description   = <<-DESCRIPTION
    A plugin for RuboCop code style enforcing & linting tool.
    It includes custom rules for RuboCop.
  DESCRIPTION
  spec.homepage      = 'https://github.com/solanolabs'


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem
  # that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rubocop', '>= 0.59.0'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
