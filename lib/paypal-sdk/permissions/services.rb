require 'paypal-sdk-core'
require 'paypal-sdk/permissions/data_types'

# AUTO GENERATED code for Permissions
module PayPal::SDK
  module Permissions

	  # Service Version
	  SERVICE_VERSION = ""
	  # Service Name
	  SERVICE_NAME = "Permissions"

    module Services
      include DataTypes


      # Service Call: RequestPermissions
      # @param RequestPermissionsRequest
      # @return RequestPermissionsResponse
      def RequestPermissions(options = {} , http_header = {})
        request_object  = BuildRequestPermissions(options)
        request_hash    = request_object.to_hash
        response_hash   = request("RequestPermissions", request_hash, http_header)
        RequestPermissionsResponse.new(response_hash)
      end
      alias_method :request_permissions, :RequestPermissions

      def BuildRequestPermissions(options = {}, &block)
        klass     = RequestPermissionsRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_request_permissions, :BuildRequestPermissions

      # Service Call: GetAccessToken
      # @param GetAccessTokenRequest
      # @return GetAccessTokenResponse
      def GetAccessToken(options = {} , http_header = {})
        request_object  = BuildGetAccessToken(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetAccessToken", request_hash, http_header)
        GetAccessTokenResponse.new(response_hash)
      end
      alias_method :get_access_token, :GetAccessToken

      def BuildGetAccessToken(options = {}, &block)
        klass     = GetAccessTokenRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_access_token, :BuildGetAccessToken

      # Service Call: GetPermissions
      # @param GetPermissionsRequest
      # @return GetPermissionsResponse
      def GetPermissions(options = {} , http_header = {})
        request_object  = BuildGetPermissions(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetPermissions", request_hash, http_header)
        GetPermissionsResponse.new(response_hash)
      end
      alias_method :get_permissions, :GetPermissions

      def BuildGetPermissions(options = {}, &block)
        klass     = GetPermissionsRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_permissions, :BuildGetPermissions

      # Service Call: CancelPermissions
      # @param CancelPermissionsRequest
      # @return CancelPermissionsResponse
      def CancelPermissions(options = {} , http_header = {})
        request_object  = BuildCancelPermissions(options)
        request_hash    = request_object.to_hash
        response_hash   = request("CancelPermissions", request_hash, http_header)
        CancelPermissionsResponse.new(response_hash)
      end
      alias_method :cancel_permissions, :CancelPermissions

      def BuildCancelPermissions(options = {}, &block)
        klass     = CancelPermissionsRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_cancel_permissions, :BuildCancelPermissions

      # Service Call: GetBasicPersonalData
      # @param GetBasicPersonalDataRequest
      # @return GetBasicPersonalDataResponse
      def GetBasicPersonalData(options = {} , http_header = {})
        request_object  = BuildGetBasicPersonalData(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetBasicPersonalData", request_hash, http_header)
        GetBasicPersonalDataResponse.new(response_hash)
      end
      alias_method :get_basic_personal_data, :GetBasicPersonalData

      def BuildGetBasicPersonalData(options = {}, &block)
        klass     = GetBasicPersonalDataRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_basic_personal_data, :BuildGetBasicPersonalData

      # Service Call: GetAdvancedPersonalData
      # @param GetAdvancedPersonalDataRequest
      # @return GetAdvancedPersonalDataResponse
      def GetAdvancedPersonalData(options = {} , http_header = {})
        request_object  = BuildGetAdvancedPersonalData(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetAdvancedPersonalData", request_hash, http_header)
        GetAdvancedPersonalDataResponse.new(response_hash)
      end
      alias_method :get_advanced_personal_data, :GetAdvancedPersonalData

      def BuildGetAdvancedPersonalData(options = {}, &block)
        klass     = GetAdvancedPersonalDataRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_advanced_personal_data, :BuildGetAdvancedPersonalData


    end

    class API < Core::API::Platform
      include Services

      def initialize(environment = nil, options = {})
        super(SERVICE_NAME, environment, options)
      end

    end
  end
end
