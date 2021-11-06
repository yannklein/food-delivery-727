require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @meals = []
    load_csv
  end

  def all
    @meals
  end

  def create(meal)
    meal.id = @meals.empty? ? 1 : @meals.last.id + 1
    @meals << meal
    save_csv
  end

  private

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << %w[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
