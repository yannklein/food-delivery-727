class Router
  def initialize
    @running = true
  end

  def run
    while @running
    end
  end

  private

  # def print_menu
  #   puts "--------------------"
  #   puts "------- MENU -------"
  #   puts "--------------------"
  #   puts "1. Add new meal"
  #   puts "2. List all meals"
  #   puts "3. Add new customer"
  #   puts "4. List all customers"
  #   puts "8. Exit"
  #   print "> "
  # end

  def stop!
    @running = false
  end
end
