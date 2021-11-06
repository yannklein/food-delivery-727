class Router
  def initialize(meals_controller, customers_controller, employees_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @employees_controller = employees_controller
    @employee = nil
  end

  def run
    while @running
      # puts "Running!"
      @employee = @employees_controller.login
      while @employee
        if @employee.manager?
          print_manager_menu
          choice = gets.chomp.to_i
          route_manager_action(choice)
        else
          print_rider_menu
          choice = gets.chomp.to_i
          route_rider_action(choice)
        end
      end
    end
  end

  private

  def print_manager_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts '7. Logout'
    puts "8. Exit"
    print "> "
  end

  def print_rider_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. List all orders"
    puts "2. Mark order as done"
    puts '7. Logout'
    puts "8. Exit"
    print "> "
  end

  def route_manager_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 7 then @employee = nil
    when 8
      @employee = nil
      @running = false
    end
  end

  def route_rider_action(choice)
    case choice
    when 1 then puts "todo"
    when 2 then puts "todo"
    when 7 then @employee = nil
    when 8
      @employee = nil
      @running = false
    end
  end

  def stop!
    @running = false
  end
end
