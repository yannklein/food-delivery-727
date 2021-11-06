class SessionsView
  def display_employees(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1} #{employee.username}"
    end
  end

  def ask_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end

  def wrong_password
    puts "Wrong password, try again!"
  end

  def greeting(name)
    puts "Hi #{name}!"
  end
end
