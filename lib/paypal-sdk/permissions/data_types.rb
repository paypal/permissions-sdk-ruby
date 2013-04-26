# Stub objects for Permissions
# Auto generated code

require 'paypal-sdk-core'

module PayPal::SDK
  module Permissions
    module DataTypes

      class DataType < Core::API::DataTypes::Base
        def self.load_members
          add_attribute :xmlns
          add_attribute :type, :namespace => :xsi
        end
      end

      module ResponseStatus
        Status = { :success => ["Success", "SuccessWithWarning"],
                   :warning => ["Warning", "SuccessWithWarning", "FailureWithWarning"],
                   :failure => ["Failure", "FailureWithWarning"] }

        def response_status
          self.responseEnvelope && self.responseEnvelope.ack
        end

        Status.keys.each do |status|
          define_method("#{status}?") do
            Status[status].include?(self.response_status)
          end
        end
      end

      class EnumType < Core::API::DataTypes::Enum
      end

      class ErrorData < DataType
        def self.load_members
          object_of :errorId, Integer
          object_of :domain, String
          object_of :subdomain, String
          object_of :severity, ErrorSeverity
          object_of :category, ErrorCategory
          object_of :message, String
          object_of :exceptionId, String
          array_of :parameter, ErrorParameter
        end
      end



      class ErrorParameter < DataType
        def self.load_members
          add_attribute :name, :required => true
          object_of :value, String, :required => true
        end
      end



      # This is the sample message 
      class ResponseEnvelope < DataType
        def self.load_members
          object_of :timestamp, DateTime, :required => true
          # Application level acknowledgment code. 
          object_of :ack, AckCode
          object_of :correlationId, String, :required => true
          object_of :build, String, :required => true
        end
      end



      # This specifies the list of parameters with every request to the service. 
      class RequestEnvelope < DataType
        def self.load_members
          # This should be the standard RFC 3066 language identification tag, e.g., en_US. 
          object_of :errorLanguage, String, :required => true
        end
      end



      class FaultMessage < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :error, ErrorData
        end
      end



      class ErrorSeverity < EnumType
        self.options = { 'ERROR' => 'Error', 'WARNING' => 'Warning' }
      end



      class ErrorCategory < EnumType
        self.options = { 'SYSTEM' => 'System', 'APPLICATION' => 'Application', 'REQUEST' => 'Request' }
      end



      #  AckCodeType This code identifies the acknowledgment code types that could be used to communicate the status of processing a (request) message to an application. This code would be used as part of a response message that contains an application level acknowledgment element. 
      class AckCode < EnumType
        self.options = { 'SUCCESS' => 'Success', 'FAILURE' => 'Failure', 'WARNING' => 'Warning', 'SUCCESSWITHWARNING' => 'SuccessWithWarning', 'FAILUREWITHWARNING' => 'FailureWithWarning', 'CUSTOMCODE' => 'CustomCode' }
      end



      #  Enumeration for Personal Attributes of a user. 
      class PersonalAttribute < EnumType
        self.options = { 'HTTPAXSCHEMAORGNAMEPERSONFIRST' => 'http://axschema.org/namePerson/first', 'HTTPAXSCHEMAORGNAMEPERSONLAST' => 'http://axschema.org/namePerson/last', 'HTTPAXSCHEMAORGCONTACTEMAIL' => 'http://axschema.org/contact/email', 'HTTPSCHEMAOPENIDNETCONTACTFULLNAME' => 'http://schema.openid.net/contact/fullname', 'HTTPAXSCHEMAORGCOMPANYNAME' => 'http://axschema.org/company/name', 'HTTPAXSCHEMAORGCONTACTCOUNTRYHOME' => 'http://axschema.org/contact/country/home', 'HTTPAXSCHEMAORGBIRTHDATE' => 'http://axschema.org/birthDate', 'HTTPAXSCHEMAORGCONTACTPOSTALCODEHOME' => 'http://axschema.org/contact/postalCode/home', 'HTTPSCHEMAOPENIDNETCONTACTSTREET1' => 'http://schema.openid.net/contact/street1', 'HTTPSCHEMAOPENIDNETCONTACTSTREET' => 'http://schema.openid.net/contact/street2', 'HTTPAXSCHEMAORGCONTACTCITYHOME' => 'http://axschema.org/contact/city/home', 'HTTPAXSCHEMAORGCONTACTSTATEHOME' => 'http://axschema.org/contact/state/home', 'HTTPAXSCHEMAORGCONTACTPHONEDEFAULT' => 'http://axschema.org/contact/phone/default', 'HTTPSWWWPAYPALCOMWEBAPPSAUTHSCHEMAPAYERID2' => 'https://www.paypal.com/webapps/auth/schema/payerID' }
      end



      # Describes the request for permissions over an account. Primary element is "scope", which lists the permissions needed. 
      class RequestPermissionsRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope
          # URI of the permissions being requested. 
          array_of :scope, String, :required => true
          # URL on the client side that will be used to communicate completion of the user flow. The URL can include query parameters. 
          object_of :callback, String, :required => true
        end
      end



      # Returns the temporary request token 
      class RequestPermissionsResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # Temporary token that identifies the request for permissions. This token cannot be used to access resources on the account. It can only be used to instruct the user to authorize the permissions. 
          object_of :token, String
          array_of :error, ErrorData
        end
      end



      # The request use to retrieve a permanent access token. The client can either send the token and verifier, or a subject. 
      class GetAccessTokenRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope
          # The temporary request token received from the RequestPermissions call. 
          object_of :token, String
          # The verifier code returned to the client after the user authorization flow completed. 
          object_of :verifier, String
          # The subject email address used to represent existing 3rd Party Permissions relationship. This field can be used in lieu of the token and verifier. 
          object_of :subjectAlias, String
        end
      end



      # Permanent access token and token secret that can be used to make requests for protected resources owned by another account. 
      class GetAccessTokenResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # Identifier for the permissions approved for this relationship. 
          array_of :scope, String
          # Permanent access token that identifies the relationship that the user authorized. 
          object_of :token, String
          # The token secret/password that will need to be used when generating the signature. 
          object_of :tokenSecret, String
          array_of :error, ErrorData
        end
      end



      # Request to retrieve the approved list of permissions associated with a token. 
      class GetPermissionsRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope
          # The permanent access token to ask about. 
          object_of :token, String, :required => true
        end
      end



      # The list of permissions associated with the token. 
      class GetPermissionsResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # Identifier for the permissions approved for this relationship. 
          array_of :scope, String
          array_of :error, ErrorData
        end
      end



      # Request to invalidate an access token and revoke the permissions associated with it. 
      class CancelPermissionsRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope
          object_of :token, String, :required => true
        end
      end



      class CancelPermissionsResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :error, ErrorData
        end
      end



      # List of Personal Attributes to be sent as a request. 
      class PersonalAttributeList < DataType
        def self.load_members
          array_of :attribute, PersonalAttribute
        end
      end



      # A property of User Identity data , represented as a Name-value pair with Name being the PersonalAttribute requested and value being the data. 
      class PersonalData < DataType
        def self.load_members
          object_of :personalDataKey, PersonalAttribute, :required => true
          object_of :personalDataValue, String, :required => true
        end
      end



      # Set of personal data which forms the response of GetPersonalData call. 
      class PersonalDataList < DataType
        def self.load_members
          array_of :personalData, PersonalData
        end
      end



      # Request to retrieve basic personal data.Accepts PersonalAttributeList as request and responds with PersonalDataList. This call will accept only 'Basic' attributes and ignore others. 
      class GetBasicPersonalDataRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope
          object_of :attributeList, PersonalAttributeList, :required => true
        end
      end



      # Request to retrieve personal data.Accepts PersonalAttributeList as request and responds with PersonalDataList. This call will accept both 'Basic' and Advanced attributes. 
      class GetAdvancedPersonalDataRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope
          object_of :attributeList, PersonalAttributeList, :required => true
        end
      end



      class GetBasicPersonalDataResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :response, PersonalDataList
          array_of :error, ErrorData
        end
      end



      class GetAdvancedPersonalDataResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :response, PersonalDataList
          array_of :error, ErrorData
        end
      end





      constants.each do |data_type_klass|
        data_type_klass = const_get(data_type_klass)
        data_type_klass.load_members if defined? data_type_klass.load_members
      end

    end
  end
end
