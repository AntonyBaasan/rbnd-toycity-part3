require_relative "errors"

class Transaction
    attr_accessor :customer, :product, :id

    @@id = 1
    @@all_transactions = []

    def initialize(customer, product)
        @customer = customer
        @product = product
        
        @id = @@id
        @@id += 1

        push_to_all_list self
        
        update_product_stock
    end
    
    def self.find(id)
        @@all_transactions.find {|p| p.id == id }
    end
    
    def self.find_by_customer(customer)
        @@all_transactions.find {|t| t.customer == customer }
    end
    
    def self.find_by_product(product)
        @@all_transactions.find {|t| t.product == product }
    end
    
    def self.all
        @@all_transactions
    end
    
    private 
    
    def push_to_all_list(transaction)
        @@all_transactions.push(transaction)
    end
    
    def update_product_stock 
        @product.purchase
    end

end