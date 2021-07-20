# Strategy
# Strategy design pattern is very similar to observer.
# We create a Context class,
# which can use strategy classes as an exchangable elements.
# If you need just one method, then consider Proc (lambda).

# Context class
class Report
    attr_reader :title, :text
    attr_accessor :formatter

    def initialize(formatter)
        @title = "Report"
        @text = "Lorem ipsum algo aqui un alli."
        @formatter = formatter
    end

    def output_report
        @formatter.output_report(self)
    end
end

# Strategy classes
class HtmlFormatter
    def output_report(context)
        puts context.title
        puts "Html format"
        puts context.text
    end
end

# Other strategy class
class PlainFormatter
    def output_report(context)
        puts context.title
        puts "Plain format"
        puts context.text
    end
end

report_1 = Report.new(HtmlFormatter.new)
report_1.output_report

report_2 = Report.new(PlainFormatter.new)
report_2.output_report

# Proc(lambda) option
# Context class
class Report_proc
    attr_reader :title, :text
    attr_accessor :formatter

    def initialize(&formatter)
        @title = "Report"
        @text = "Lorem ipsum algo aqui un alli."
        @formatter = formatter
    end

    def output_report
        @formatter.call(self)
    end
end

Html_formatter = lambda do |context|
    puts context.title
    puts "Lambda option"
    puts context.text
end

report_3 = Report_proc.new &Html_formatter
report_3.output_report
