# Regexp

example = "..A..."

example =~ /A/

Regexp.last_match # => 2 (index of 'A')

Regexp.last_match.pre_match # => ".."

Regexp.last_match.post_match # => "..."

$` # => ".." same as Regexp.last_match.pre_match

$' # => "..." same as Regexp.last_match.post_match
