require 'paypal-sdk-core'

module PayPal
  module SDK
    module Permissions
      class API < Core::API::Platform
        include Services

        def initialize(environment = nil, options = {})
          super(SERVICE_NAME, environment, options)
        end

        PERMISSIONS_HTTP_HEADER = { "X-PAYPAL-REQUEST-SOURCE" => "permissions-ruby-#{VERSION}" }
        def default_http_header
          super.merge(PERMISSIONS_HTTP_HEADER)
        end
      end
    end
  end
end

