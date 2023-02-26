# frozen_string_literal: true

require_relative 'lib/mycert/version'

Gem::Specification.new do |spec|
  spec.name = 'mycert'
  spec.version = Mycert::VERSION
  spec.authors = ['hahwul']
  spec.email = ['hahwul@gmail.com']

  spec.summary = 'Generate RootCA for Pentesting'
  spec.description = 'Generate RootCA for ZAP/BurpSuite/Android/iOS/Etc..'
  spec.homepage = 'https://github.com/hahwul/mycert'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/hahwul/mycert'
  spec.license = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = 'mycert'
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor', '~> 1.2.1'
end
