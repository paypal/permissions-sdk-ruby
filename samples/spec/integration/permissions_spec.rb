require 'spec_helper'

describe "PermissionsSample", :js => true do

  it "Request permissions" do
    visit "https://developer.paypal.com/"
    fill_in "Email Address", :with => "platform.sdk.seller@gmail.com"
    fill_in "Password", :with => "11111111"
    click_button "Log In"

    visit permissions_samples_path
    click_link "Request Permissions"
    check "EXPRESS_CHECKOUT"
    click_button "Submit"
    page.should have_content("ack: Success")

    click_link("Follow the link to generate token")
    sleep(5)
    fill_in "Email:", :with => "platfo_1255170694_biz@gmail.com"
    fill_in "Password:", :with => "11111111"
    click_button "Log In"

    click_button "Grant Permission"
    click_link   "Return to"

    click_button "Submit"
    page.should have_content("ack: Success")
  end

end if ENV["SELENIUM"]
