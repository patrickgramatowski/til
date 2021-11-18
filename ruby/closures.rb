# Create 'class' using lambda
ExampleLambdaClass = lambda do
  x = 1
  
  get_x = lambda { x }
  add_y_to_x = lambda { |y| x += y }

  {show: get_x, add: add_y_to_x}
end

example = ExampleClass.call

example[:show].call # => 1

example[:add].call(12) # => 13


# Create 'reduce' using lambdas / lexical scope / free variable
imitate_reduce = lambda do |acc, arr, operation|
  inside_reduce = lambda do |acc, arr|
    if arr.empty?
      acc
    else
      acc = operation.call(acc, arr.first) # 'operation' - free variable
      inside_reduce.call(acc, arr.drop(1))
    end
  end

  inside_reduce.call(acc, arr)
end

# lambda can be assigned to a variable, put as an argument and also can be returned -> first-class function
# note: methods in ruby are not first-class functions
imitate_reduce.call(0, [1,2,3,4], lambda { |x, y| x + y }) # => 10
