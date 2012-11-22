module PayPal
  module SDK
    module Permissions
      autoload :Version,   "paypal-sdk/permissions/version"
      autoload :Services,  "paypal-sdk/permissions/services"
      autoload :DataTypes, "paypal-sdk/permissions/data_types"
      autoload :API,       "paypal-sdk/permissions/api"

      def self.new(*args)
        API.new(*args)
      end
    end
  end
end
