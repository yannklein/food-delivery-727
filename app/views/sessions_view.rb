class SessionsView
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
