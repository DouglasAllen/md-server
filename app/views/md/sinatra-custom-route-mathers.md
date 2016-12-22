## Custom Route Matchers

As shown above, Sinatra ships with built-in support for using String patterns
and regular expressions as route matches. However, it does not stop there. You
can easily define your own matchers:

``` ruby
class AllButPattern
  Match = Struct.new(:captures)

  def initialize(except)
    @except   = except
    @captures = Match.new([])
  end

  def match(str)
    @captures unless @except === str
  end
end

def all_but(pattern)
  AllButPattern.new(pattern)
end

get all_but("/index") do
  # ...
end
```

Note that the above example might be over-engineered, as it can also be
expressed as:

``` ruby
get // do
  pass if request.path_info == "/index"
  # ...
end
```

Or, using negative look ahead:

``` ruby
get %r{^(?!/index$)} do
  # ...
end
```