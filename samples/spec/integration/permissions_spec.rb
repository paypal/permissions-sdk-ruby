require 'spec_helper'

describe "PermissionsSample" do

  before do
    visit permissions_samples_path
  end

  it_check_sample "Request Permissions" do
    check "EXPRESS_CHECKOUT"
  end

  it_check_sample "Get Access Token" do
    pending "Need to generate token"
    fill_in "Verifier", :with => "1234"
    fill_in "Token",    :with => "1234"
  end

end
