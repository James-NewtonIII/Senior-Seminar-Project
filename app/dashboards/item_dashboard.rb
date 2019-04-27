require "administrate/base_dashboard"

class ItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    line_items: Field::HasMany,
    id: Field::Number,
    expense_type: Field::String,
    amount: Field::String.with_options(searchable: false),
    ba_approval: Field::Boolean,
    ba_reason: Field::String,
    image_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    actual_expense_date: Field::DateTime,
    department: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :line_items,
    :id,
    :expense_type,
    :amount,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :line_items,
    :id,
    :expense_type,
    :amount,
    :ba_approval,
    :ba_reason,
    :image_url,
    :created_at,
    :updated_at,
    :actual_expense_date,
    :department,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :line_items,
    :expense_type,
    :amount,
    :ba_approval,
    :ba_reason,
    :image_url,
    :actual_expense_date,
    :department,
  ].freeze

  # Overwrite this method to customize how items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(item)
  #   "Item ##{item.id}"
  # end
end
