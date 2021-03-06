require_relative "errors"

class Customer
    attr_reader :name
    
    @@all_customers = []
    
    def initialize params={}
        @name = params[:name]
        @purchase_history = []
        
        push_to_all_list self
    end 

    def self.find_by_name(search_name)
        @@all_customers.find {|p| p.name == search_name }
    end
    
    def self.all
        @@all_customers
    end

    def ==(other_object)
        (@name == other_object.name)
    end

    def purchase product
        unless(product.in_stock?)
            raise OutOfStockError, "'#{product.title}' is out of stock"
        end

        Transaction.new(self, product)
    end
    
    private 
    def push_to_all_list(customer)
        if(@@all_customers.include?(customer))
            raise DuplicateCustomerError, "'#{customer.name}' already exists"
        end
          
        @@all_customers.push(customer)
    end

end