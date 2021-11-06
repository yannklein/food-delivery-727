require_relative 'router'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/orders_controller'
require_relative 'app/repositories/order_repository'

MEALS_CSV_FILE = File.join(__dir__, "data/meals.csv")
CUSTOMERS_CSV_FILE = File.join(__dir__, "data/customers.csv")
EMPLOYEES_CSV_FILE = File.join(__dir__, "data/employees.csv")
ORDERS_CSV_FILE = File.join(__dir__, "data/orders.csv")
# p __dir__ # absolute root folder path

customer_repository = CustomerRepository.new(CUSTOMERS_CSV_FILE)
customers_controller = CustomersController.new(customer_repository)

meal_repository = MealRepository.new(MEALS_CSV_FILE)
meals_controller = MealsController.new(meal_repository)

employee_repository = EmployeeRepository.new(EMPLOYEES_CSV_FILE)
sessions_controller = SessionsController.new(employee_repository)

order_repository = OrderRepository.new(ORDERS_CSV_FILE, meal_repository, customer_repository, employee_repository)
orders_controller = OrdersController.new(order_repository, meal_repository, customer_repository, employee_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller, orders_controller)
router.run

# - [x] As a manager I can list all meals
# - [x] As a manager I can add a meal
# - [x] As a manager I can list all customers
# - [x] As a manager I can add a customer
# - [X] As a manager I can list undelivered orders
# - [X] As a manager I can add an order

# - [X] As a rider I can list my undelivered orders
# - [ ] As a rider I can mark an order as delivered

# +--------------------+
# |       Order        |
# +--------------------+
# | @id                |
# | @customer          |
# | @meal              |
# | @employee          |
# | @delivered         |
# +--------------------+
# | mark_as_delivered! |
# +--------------------+