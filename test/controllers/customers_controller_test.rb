require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index from the root URL" do
    get root_url
    assert_response :success
  end

  test "should get alphabetized" do
    get customers_alphabetized_url
    assert_response :success
  end

  test "should get missing email" do
    get customers_missing_email_url
    assert_response :success
  end
end

# Pao Notes:
# Integration tests make requests to the application's routes.
# assert_response :success confirms that each page returns HTTP status 200.