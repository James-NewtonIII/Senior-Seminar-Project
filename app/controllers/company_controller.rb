class CompanyController < ApplicationController
  def index
    @items = Item.order(:amount)
    @request_items = RequestItem.order(:amount)
    @taf_items = TafItem.order(:expense_date)
  end
end
