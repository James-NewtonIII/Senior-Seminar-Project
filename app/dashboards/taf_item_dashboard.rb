require "administrate/base_dashboard"

class TafItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    taf_line_item: Field::HasOne,
    id: Field::Number,
    request_reason: Field::String,
    expense_date: Field::DateTime,
    estimated_amount: Field::String.with_options(searchable: false),
    dept: Field::String,
    ba_approval: Field::Boolean,
    ba_reason: Field::Text,
    expense_type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    taf_line_item_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :taf_line_item,
    :id,
    :request_reason,
    :expense_date,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :taf_line_item,
    :id,
    :request_reason,
    :expense_date,
    :estimated_amount,
    :dept,
    :ba_approval,
    :ba_reason,
    :expense_type,
    :created_at,
    :updated_at,
    :taf_line_item_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :taf_line_item,
    :request_reason,
    :expense_date,
    :estimated_amount,
    :dept,
    :ba_approval,
    :ba_reason,
    :expense_type,
    :taf_line_item_id,
  ].freeze

  # Overwrite this method to customize how taf items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(taf_item)
  #   "TafItem ##{taf_item.id}"
  # end
end
