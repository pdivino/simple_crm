class Customer < ApplicationRecord
  has_one_attached :image

  validates :full_name, presence: true
  validates :email_address,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: "must be a valid email address"
            },
            allow_blank: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[
      id
      full_name
      phone_number
      email_address
      notes
      created_at
      updated_at
    ]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end

# Pao Notes:
# Customer inherits database features from ApplicationRecord.
# has_one_attached connects one uploaded image to each customer.
#
# full_name is required before a customer can be saved.
# email_address remains optional because the assignment requires
# customers with missing email addresses.
# If an email is supplied, it must have a valid email format.
#
# ActiveAdmin uses Ransack to search, filter, and sort records.
# ransackable_attributes explicitly lists the customer columns that
# administrators are permitted to search.
# The _auth_object parameter starts with an underscore because this
# method receives it but does not use it.
#
# ransackable_associations returns an empty array because this project
# does not need to search through Customer associations.
# The Active Storage image tables are therefore excluded from searches.