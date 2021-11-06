class MealsView
  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} | $#{meal.price}"
    end
  end

  def ask_for(something)
    puts "#{something}?"
    gets.chomp
  end
end