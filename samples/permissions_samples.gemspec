$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "permissions_samples/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "permissions_samples"
  s.version     = PermissionsSamples::VERSION
  s.authors     = ["siddick"]
  s.email       = ["mebramsha@paypal.com"]
  s.homepage    = "https://www.x.com/"
  s.summary     = "Samples for Permissions."
  s.description = "Samples for Permissions."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "paypal-sdk-permissions"
  s.add_dependency "twitter-bootstrap-rails"
  s.add_dependency "simple_form"
  s.add_dependency "haml"
  s.add_dependency "coderay"
  s.add_dependency "jquery-rails"
end
