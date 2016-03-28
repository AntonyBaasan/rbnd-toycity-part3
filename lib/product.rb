require_relative "errors"

class Product
    attr_accessor :title, :price, :stock
    
    @@all_products = []

    def initialize(params={})
        @title = params[:title]
        @price = params[:price]
        @stock = params[:stock]

        push_to_all_list self
    end
    
    def self.all
        @@all_products
    end
    
    # override equality operator
    def ==(other_object)
        (@title == other_object.title && @price == other_object.price && @stock == other_object.stock)
    end
    
    private 
    def push_to_all_list(product)
        if(@@all_products.include?(product))
            raise DuplicateProductError
        end
          
        @@all_products.push(product)
    
    end
end