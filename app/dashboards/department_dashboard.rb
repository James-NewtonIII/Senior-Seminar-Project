require "administrate/base_dashboard"

class DepartmentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    budget_approver: Field::HasOne,
    id: Field::Number,
    name: Field::String,
    actual_funds: Field::String.with_options(searchable: false),
    available_funds: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :budget_approver,
    :id,
    :name,
    :actual_funds,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :budget_approver,
    :id,
    :name,
    :actual_funds,
    :available_funds,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :budget_approver,
    :name,
    :actual_funds,
    :available_funds,
  ].freeze

  # Overwrite this method to customize how departments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(department)
  #   "Department ##{department.id}"
  # end
end
