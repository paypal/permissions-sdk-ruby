# Permissions[ Work in progress !! ]

SDK for Permissions.

## Installation

Add this line to your application's Gemfile:

    gem 'paypal-sdk-permissions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paypal-sdk-permissions

## Configuration

For Rails application:

    rails g paypal:sdk:install

For other ruby application, create a configuration file(`config/paypal.yml`):

    development: &default
      username: jb-us-seller_api1.paypal.com
      password: WX4WTU3S8MY44S7F
      signature: AFcWxV21C7fd0v3bYYYRCpSSRl31A7yDhhsPUU2XhtMoZXsWHFxu-RWy
      app_id: APP-80W284485P519543T
      http_timeout: 30
      mode: sandbox
      # # with certificate
      # cert_path: "config/cert_key.pem"
      # # with token authentication
      # token: ESTy2hio5WJQo1iixkH29I53RJxaS0Gvno1A6.YQXZgktxbY4I2Tdg
      # token_secret: ZKPhUYuwJwYsfWdzorozWO2U9pI
      # # with Proxy
      # http_proxy: http://proxy-ipaddress:3129/
      # # with device ip address
      # device_ipaddress: "127.0.0.1"
    test:
      <<: *default
    production:
      <<: *default
      mode: live

Load Configurations from specified file:

    PayPal::SDK::Core::Config.load('config/paypal.yml',  ENV['RACK_ENV'] || 'development')

## Create API object

Create API object:

    api = PayPal::SDK::Permissions::API.new

Override configuration while creating a object:

    api = PayPal::SDK::Permissions::API.new(:development)
    api = PayPal::SDK::Permissions::API.new(:development, :app_id => "XYZ")
    api = PayPal::SDK::Permissions::API.new(:app_id => "XYZ")    # Take default environment.

Change configuration:

    api.set_config :testing
    api.set_config :testing, app_id => "XYZ"


## Build Request Object

To make api request, we need to build a request object.

    # To build a empty request object for get verified status
    request_permissions = api.build_request_permissions()

    # To build a request object with default data
    request_permissions = api.build_request_permissions( :callback => "http://localhost:3000/permissions/get_access_token" )

The Build method can be access with camelcase or underscore:

    api = api.build_request_permissions()
    # (or)
    api = api.BuildRequestPermissions()

## Assign value to members

Members can be access with camelcase or underscore format.

    request_permissions.scope = ["TRANSACTION_SEARCH","ACCOUNT_BALANCE","BILLING_AGREEMENT"]

To Get members list for the given object( For Reference ):

    request_permission.members

## Make API Request

Make api call with request object:

    request_permissions_response = api.request_permissions(request_permissions)

Make api call with hash:

    request_permissions_response = api.request_permissions( :scope => ["TRANSACTION_SEARCH"], :callback => "http://localhost:3000/permissions/get_access_token" )


## Access values from response object

To get response status:

    request_permissions_response.responseEnvelope.ack

## Example

```ruby
require 'paypal-sdk-permissions'
@api = PayPal::SDK::Permissions::API.new

# Build request object
@request_permissions_request = @api.build_request_permissions()
@request_permissions_request.scope    = ["EXPRESS_CHECKOUT"]
@request_permissions_request.callback = "http://localhost:3000/permissions/get_access_token"

# Make API call & get response
@request_permissions_response = @api.request_permissions(@request_permissions_request)

# Access Response
@request_permissions_response.responseEnvelope
@request_permissions_response.token
```

## Samples

Add following line in rails `Gemfile`:

    gem 'paypal-sdk-permissions'
    gem 'permissions_samples', :git => "https://github.com/paypal/permissions-ruby.git", :group => :development

Configure routes(`config/routes.rb`):

    mount PermissionsSamples::Engine => "/samples" if Rails.env.development?

To get default paypal configuration execute:

    rails g paypal:sdk:install

Run `rails server` and check the samples.
