# Method template
# One 'abstract' class contains template_method.
# The class also defines other (abstract/optional) methods.
# If method needs to be overwritten,
# then should be defined as an abstarct method.
# The template_method calls all other (optional) methods.

# Example:

# The abstract class
class Report
    def initialize
        @title = "Title"
        @text = "Lorem ipsum dolor lorem algo es un aqui."
    end

    # the template_method
    def output_report
        output_start
        output_title
        output_body
        output_end
    end

    # Optional methods
    def output_start
        # some code
    end

    def output_end
        # some code
    end

    # Methods which needs to be inqluded = abstract methods
    def output_title
        raise "Abstract method output_title called"
    end

    def output_body
        raise "Abstract method output_body called"
    end
end

# Other classes
class AbstractOnly < Report
    def output_title
        puts @title
    end

    def output_body
        puts @text << " Abstract methods"
    end
end

class OptionalAndAbstract < Report
    def output_start
        puts "Here is optional method called output_start"
    end
    
    def output_title
        puts @title
    end

    def output_body
        puts @text
    end
end

abs = AbstractOnly.new
abs.output_report

puts "Now optional included"

opt = OptionalAndAbstract.new
opt.output_report