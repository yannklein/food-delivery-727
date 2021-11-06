require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/sessions_view'

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @orders_view.display_orders(orders)
  end

  def add
    meals = @meal_repository.all
    @meals_view.display_meals(meals)
    meal_index = @meals_view.ask_for(:index).to_i - 1
    meal = meals[meal_index]

    customers = @customer_repository.all
    @customers_view.display_customers(customers)
    customer_index = @customers_view.ask_for(:index).to_i - 1
    customer = customers[customer_index]

    employees = @employee_repository.all_riders
    @sessions_view.display_employees(employees)
    employee_index = @sessions_view.ask_for(:index).to_i - 1
    employee = employees[employee_index]

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_my_undelivered_orders(current_user)
    orders = @order_repository.my_undelivered_orders(current_user)
    @orders_view.display_orders(orders)
  end

  def mark_as_delivered(current_user)
    list_my_undelivered_orders(current_user)
    order_index = @orders_view.ask_for(:index).to_i - 1
    orders = @order_repository.my_undelivered_orders(current_user)
    order = orders[order_index]
    @order_repository.mark_as_delivered(order)
  end
end