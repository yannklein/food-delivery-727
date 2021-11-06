class CustomersView
  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} : #{customer.address}"
    end
  end

  def ask_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end
end
