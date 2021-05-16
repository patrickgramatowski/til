# Composite
# There is a component, which is a tool to create a 'tree'.
# Component (tree) is made of leafs and composites (also made of leafs).
# We create a smallest part (leaf) - class,
# then we can create a composite made of leafs.

# Component class
class Task
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def get_informations
        0
    end
end

# Composite class
class CompositeTask < Task
    def initialize(name)
        @name = name
        @sub_task = []
    end

    def add_sub_task(task)
        @sub_task << task
    end

    def remove_sub_task(task)
        @sub_task.delete(task)
    end

    def get_informations
        information = 0
        @sub_task.each do |task|
            information += task.get_informations
        end
        information
    end
end

class Leaf_1 < Task
    def initialize
        super("Drop down!")
    end

    def get_informations
        3
    end
end

class Leaf_2 < Task
    def initialize
        super("Drop down!")
    end

    def get_informations
        2
    end
end

class Leaf_3 < Task
    def initialize
        super("Drop down!")
    end

    def get_informations
        1
    end
end

class Stick < CompositeTask
    def initialize
        super("Grow!")
        add_sub_task(Leaf_1.new)
        add_sub_task(Leaf_2.new)
        add_sub_task(Leaf_3.new)
    end
end

composite = Stick.new
puts composite.get_informations