module Admin
  class CategoriesController < ApplicationController
    before_action :authenticate_doctor!

    def new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to admin_profile_path, notice: 'Category was successfully created.'
      else
        redirect_to new_admin_category_path, notice: 'Troubles with category creation'
      end
    end

    private

    def category_params
      params.permit(:name)
    end
  end
end
