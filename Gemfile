source 'https://rubygems.org'

gemspec

gem 'paypal-sdk-core', :git => "https://github.com/paypal/sdk-core-ruby.git"

if File.exist? File.expand_path('../samples/permissions_samples.gemspec', __FILE__)
  gem 'permissions_samples', :path => 'samples', :require => false
  group :test do
    gem 'rspec-rails', :require => false
    gem 'capybara', '~> 2.0.3', :require => false
  end
end

group :test do
  gem 'rspec'
end

gem 'nokogiri', '~> 1.5.9', :platform => :mri_18
