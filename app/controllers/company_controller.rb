class CompanyController < ApplicationController
  def index
    @items = Item.order(:amount)
  end
end
