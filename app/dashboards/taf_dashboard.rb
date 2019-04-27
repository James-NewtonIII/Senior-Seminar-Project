require "administrate/base_dashboard"

class TafDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    taf_line_items: Field::HasMany,
    taf_items: Field::HasMany,
    id: Field::Number,
    pm_reject_reason: Field::String,
    total_estimated_amount: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    payment_manager_id: Field::Number,
    quantity: Field::Number,
    pm_approval: Field::Boolean,
    pm_reason: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :taf_line_items,
    :taf_items,
    :id,
    :pm_reject_reason,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :taf_line_items,
    :taf_items,
    :id,
    :pm_reject_reason,
    :total_estimated_amount,
    :created_at,
    :updated_at,
    :payment_manager_id,
    :quantity,
    :pm_approval,
    :pm_reason,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :taf_line_items,
    :taf_items,
    :pm_reject_reason,
    :total_estimated_amount,
    :payment_manager_id,
    :quantity,
    :pm_approval,
    :pm_reason,
  ].freeze

  # Overwrite this method to customize how tafs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(taf)
  #   "Taf ##{taf.id}"
  # end
end
