class Employee
  attr_reader :name, :title, :boss, :salary 

  def initialize(name, title, salary, boss)
    @name = name 
    @title = title
    @salary = salary
    @boss = boss
    add_boss
  end

  def add_boss
    @boss.employees << self unless @boss.nil?
  end

  def bonus(multiplier)
    bonus = (salary * multiplier)
  end

end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def employees
    @employees
  end

  def bonus(multiplier)
    bonus = total_sal * multiplier
  end

  def total_sal
    return salary unless self.is_a?(Manager)
    sum = 0
    employees.each do |employee|
      if employee.is_a?(Manager)
        sum += employee.salary + employee.total_sal
      else
        sum += employee.salary
      end
    end
    sum
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
