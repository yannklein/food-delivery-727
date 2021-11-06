require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv_path, meal_repository, customer_repository, employee_repository)
    @csv_path = csv_path
    @orders = []
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    load_csv
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def my_undelivered_orders(current_user)
    undelivered_orders.select { |order| order.employee == current_user }
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  def create(order)
    order.id = @orders.empty? ? 1 : @orders.last.id + 1
    @orders << order
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << ['id', 'meal_id', 'customer_id', 'employee_id', 'delivered']
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end

  def load_csv
    options = { headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_path, options) do |row|
      id = row[:id].to_i
      delivered = row[:delivered] == 'true'
      meal = @meal_repository.find(row[:meal_id].to_i)
      employee = @employee_repository.find(row[:employee_id].to_i)
      customer = @customer_repository.find(row[:customer_id].to_i)
      @orders << Order.new(id: id, delivered: delivered, meal: meal, customer: customer, employee: employee)
    end
  end
end