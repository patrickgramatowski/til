# Regexp

example = "..A..."

example =~ /A/

Regexp.last_match # => 2 (index of 'A')

Regexp.last_match.pre_match # => ".."

Regexp.last_match.post_match # => "..."

$` # => ".." same as Regexp.last_match.pre_match

$' # => "..." same as Regexp.last_match.post_match

# Parallel Assignment

a = [1, 2, 3, 4]

b, *c = 99, a # => b == 99,	c == [[1, 2, 3, 4]]
b, c = 99, *a # => b == 99,	c == 1
b, *c = 99, *a # => b == 99,	c == [1, 2, 3, 4]

# Spaces as String Delimiters

s = % text .length # => 4

# Instance Variable Interpolation Shorthand

@xyz = 444

"Cost: #@xyz$" # => "Cost: 444$"

# Exploding Ranges Into Arrays

[*1..8] # => [1, 2, 3, 4, 5, 6, 7, 8]
