class CategoriesController < ApplicationController
    before_action :redirect_if_not_signed_in, only: [:new, :create]
    
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to categories_path
        else
            render :new
        end
    end

    def popular_category
        cat = Category.find(session[:category_id])
        @popular_cat = cat.categories.most_popular_cat
    end

private

    def category_params
        params.require(:category).permit(:name)
    end
end
