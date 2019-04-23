class CompanyController < ApplicationController
  def index
    @items = Item.order(:amount)
    @request_items = RequestItem.order(:amount)
  end
end
