class Product
    attr_accessor :title, :price, :stock

    def initialize(params={})
        @title = params[:title]
        @price = params[:price]
        @stock = params[:stock]
    end
end