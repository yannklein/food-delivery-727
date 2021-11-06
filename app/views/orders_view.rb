class OrdersView
  def display_orders(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} #{order.meal.name} for #{order.customer.name} | #{order.employee.username}"
    end
  end

  def ask_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end
end
