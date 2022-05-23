require "active_support/concern"

module Example
  extend ActiveSupport::Concern

  def hello
    puts "hello"
  end

  included do
    def method_of_instance_1
      puts "method_of_instance_1"
    end

    def method_of_instance_2
      puts "method_of_instance_2"
    end
  end

  class_methods do
    def method_of_class_1
      puts "method_of_class_1"
    end
  end

end

class ClassExample
  include Example
end

obj = ClassExample.new
ClassExample.method_of_class_1
obj.method_of_instance_1
obj.method_of_instance_2
obj.hello
