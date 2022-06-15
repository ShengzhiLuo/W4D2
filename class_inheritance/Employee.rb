class Employee
    attr_accessor :name, :salary, :title, :boss
    def initialize(name, salary, title, boss = nil)
        @name = name
        @salary = salary
        @title = title
        self.boss = boss
    end
    def boss=(boss)
        Employee.boss = boss
        while !boss.nil?
        boss.add_employee(self) 
        end
    
        boss
    end
    def bonus(multiplier)
        self.salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :employees
    def initialize(name, salary, title, boss = nil)
        super(name, salary, title, boss)
        @employees = []
    end
    def add_employee(worker)
        employees << worker
    
        worker
    end
    def total_salary
        total_salary = 0
        self.employees.each do |employee|
          if employee.is_a?(Manager)
            total_salary += employee.salary + employee.total_salary
          else
            total_salary += employee.salary
          end
        end
    
        total_salary
    end
    def bonus(multiplier)
        self.total_salary * multiplier
    end

end