require 'pry'

class CashRegister

    attr_accessor :employee_discount, :total
    attr_reader :items

    def initialize(employee_discount=0)
        @total = 0
        @employee_discount = employee_discount
        @items = []
        @last_item = {}
    end

    def discount
        @employee_discount = 20
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        #keep track of list of pervious transaction prices
        @last_item[title] = {"quantity" => quantity, "price" => price}
        #add quantity amount of items to the end of the items array
        @items.fill(title, @items.length, quantity)
    end

        #gives total after discount, I guess assuming only interger totals at this strange store
    def apply_discount
        if @employee_discount != 0
            @total *= (1 - @employee_discount.to_f/100.0)
            message = "After the discount, the total comes to $#{@total.to_i}."
        else 
            message = "There is no discount to apply."
        end
        message    
    end

    def void_last_transaction
        #binding.pry
        @total -= @last_item[@items.last]["price"] * @last_item[@items.last]["quantity"]
        @last_item.delete(@items.last)
        @items.pop
    end

end
