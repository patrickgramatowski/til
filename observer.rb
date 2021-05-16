# Observer
# Very similar to strategy design patter.
# We create a subject module and observers,
# observers are watching the subject.
# Ruby inclueds observer module built-in.

# Subject module
module Subject
    def initialize
        @observers = []
    end

    def add_observer(observer)
        @observers << observer
    end

    def delete_observer(observer)
        @observers.delete(observer)
    end

    def notify_observers
        @observers.each do |observer|
            observer.update(self)
        end
    end
end

class Employee
    include Subject

    attr_reader :name, :title
    attr_reader :salary

    def initialize(name, title, salary)
        super()
        @name = name
        @title = title
        @salary = salary
    end

    def salary=(new_salary)
        old_salary = @salary
        @salary = new_salary
        # check if salary has changed
        if old_salary != new_salary
            notify_observers
        end
    end
end

# Observer no.1
class TaxMan
    def update(employee)
        puts "New salary #{employee.salary} for #{employee.name}!"
    end
end

# Observer no.2
class Payroll
    def update(employee)
        puts "New payroll #{employee.salary} for #{employee.name}!"
    end
end

employee = Employee.new("Fred", "Worker", 2000)
employee.add_observer(Payroll.new)
employee.add_observer(TaxMan.new)
puts employee.salary
employee.salary = 2500
