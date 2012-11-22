require_dependency "permissions_samples/application_controller"

module PermissionsSamples
  class PermissionsController < ApplicationController
    include PayPal::SDK::Permissions

    def index
      redirect_to :action => :request_permissions
    end

    def request_permissions
      @request_permissions = api.build_request_permissions(params[:RequestPermissionsRequest] || default_api_value)
      # Set default callback URL
      @request_permissions.callback ||= permissions_url(:get_access_token)
      @request_permissions_response = api.request_permissions(@request_permissions) if request.post?
    end

    def get_access_token
      @get_access_token = api.build_get_access_token(params[:GetAccessTokenRequest] || default_api_value)

      # To handle the return value from paypal
      @get_access_token.token     = params["request_token"]     if params["request_token"]
      @get_access_token.verifier  = params["verification_code"] if params["verification_code"]

      @get_access_token_response = api.get_access_token(@get_access_token) if request.post?
    end

    private

    def api
      @api ||= API.new
    end
  end
end
