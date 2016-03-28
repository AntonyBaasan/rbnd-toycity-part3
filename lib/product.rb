class Product
    attr_accessor :title, :price, :stock
    
    @@all_products = []

    def initialize(params={})
        @title = params[:title]
        @price = params[:price]
        @stock = params[:stock]
        
        @@all_products.push(self)
    end
    
    def self.all
        @@all_products
    end
end