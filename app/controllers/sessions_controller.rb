require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    # ask for username
    username = @sessions_view.ask_for(:username)
    # ask for password
    password = @sessions_view.ask_for(:password)
    # find employee by username
    employee = @employee_repository.find_by_username(username)
    # check if employee exists and password correct
    if employee && employee.password == password
      # YES: display the menu
      @sessions_view.greeting(username)
      employee
    else
      # NO: "Wrong password!" -> login
      @sessions_view.wrong_password
      login
    end
  end
end
