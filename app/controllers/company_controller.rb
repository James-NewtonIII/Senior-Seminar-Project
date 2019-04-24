class CompanyController < ApplicationController
  def index
    @items = Item.order("amount DESC")
    @request_items = RequestItem.order(:amount)
    @taf_items = TafItem.order(:expense_date)
  end
end
