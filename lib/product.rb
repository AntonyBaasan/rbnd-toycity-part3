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
    
    def in_stock?
        @stock > 0
    end
    
    def purchase
        if(@stock == 0)
            raise OutOfStockError, "'#{@title}' is out of stock"
        end
        
        @stock -= 1
    end
    
    def self.all
        @@all_products
    end
    
    def self.find_by_title(search_title)
        @@all_products.find {|p| p.title == search_title   }
    end
    
    def self.in_stock
        @@all_products.select {|p| p.stock > 0}
    end
    
    # override equality operator
    def ==(other_object)
        (@title == other_object.title && @price == other_object.price && @stock == other_object.stock)
    end
    
    
    private 
    def push_to_all_list(product)
        if(@@all_products.include?(product))
            raise DuplicateProductError, "'#{product.title}' already exists"
        end
          
        @@all_products.push(product)    
    end
end