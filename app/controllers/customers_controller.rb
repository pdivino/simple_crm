class CustomersController < ApplicationController
  def index
    @customers = Customer.with_attached_image.all
  end

  def alphabetized
    @customers = Customer.with_attached_image.order(:full_name)
  end

  def missing_email
    @customers = Customer.with_attached_image.where(email_address: [nil, ""])
  end
end

# Pao Notes:
# Each public method is a controller action.
# @customers is an instance variable available to the matching view.
#
# index loads every customer from the database.
# alphabetized uses ORDER BY to sort customers by full_name.
# missing_email finds both NULL and empty-string email values.
#
# with_attached_image loads image attachments along with the customers.
# This avoids extra database queries when the view checks each image.