require 'spec_helper'

describe "Permissions" do

  before :all do
    @client = PayPal::SDK::Permissions::API.new
  end

  describe "Services" do
    PayPal::SDK::Permissions::Services.instance_methods.select{|s| s =~ /^[A-Z]/ and s !~ /^Build/ }.each do |service_method|
      it "make empty request to #{service_method}" do
        response = @client.send(service_method, {})
        response.response_envelope.ack.should_not be_nil
      end
    end
  end

end
