ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email_address, :notes, :image 

  remove_filter :image_attachment
  remove_filter :image_blob

  index do
    selectable_column
    id_column

    column :image do |customer|
      if customer.image.attached?
        image_tag customer.image, width: 75, alt: customer.full_name
      else
        "No image"
      end
    end

    column :full_name
    column :phone_number
    column :email_address
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :image do |customer|
        if customer.image.attached?
          image_tag customer.image, width: 250, alt: customer.full_name
        else
          "No image uploaded"
        end
      end

      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors

    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file
    end

    f.actions
  end
end

# Pao Notes:
# permit_params lists the fields ActiveAdmin is allowed to save.
# :image permits an uploaded file from the administrator form.
# index controls the customer table shown in ActiveAdmin.
# show controls the page for one customer.
# form defines the fields used to create or edit a customer.
# attached? prevents image_tag from trying to display a missing image. 
# remove_filter prevents ActiveAdmin from generating search fields for
# Active Storage's internal image_attachment and image_blob associations.
# Customers can still upload and display images; only image searching is disabled.