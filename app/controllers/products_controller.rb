class ProductsController < ApplicationController

    def index
        render plain: "List of products"
    end 

end
