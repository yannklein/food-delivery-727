class Employee
  attr_accessor :id
  attr_reader :username, :password

  def initialize(attributes = {})
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    @role == 'manager'
  end
end
