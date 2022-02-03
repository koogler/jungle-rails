class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['AUTHENTICATION_USERNAME'], password: ENV['AUTHENTICATION_PASSWORD']
  
  def show
    @product_num = Product.all.count
    @category_num = Category.all.count
  end

end
