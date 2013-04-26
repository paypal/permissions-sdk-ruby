module PayPal
  module SDK
    module Permissions
      module Urls
        REDIRECT_ENDPOINTS = {
          :live => "https://www.paypal.com/webscr",
          :sandbox => "https://www.sandbox.paypal.com/webscr" }

        def redirect_url(params = {})
          "#{REDIRECT_ENDPOINTS[api_mode]}?#{encode_www_form(params)}"
        end

        def grant_permission_url(token)
          token = token.token if token.respond_to?(:token)
          redirect_url(:cmd => "_grant-permission", :request_token => token.to_s)
        end
        alias_method :request_permissions_url, :grant_permission_url

      end
    end
  end
end
