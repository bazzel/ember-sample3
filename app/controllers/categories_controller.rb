class CategoriesController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Category.all
  end
end
