require "pry"

class CashRegister
  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @all = []
    @last_transaction = {}
    @discount = discount
  end

  def add_item(item, price, quantity = 1)
    # binding.pry
    @total += price * quantity
    quantity.times {@all << item}
    
    @last_transaction = {"item": item, "price": price, "quantity": quantity}
  end

  def apply_discount
    @total = @total - @total * @discount / 100
    if @discount == 0
      return "There is no discount to apply."
    else
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @all
  end

  def void_last_transaction
    void_total = @last_transaction[:price] * @last_transaction[:quantity]
    @total = @total - void_total * (100 - @discount) / 100
  end
  
end


