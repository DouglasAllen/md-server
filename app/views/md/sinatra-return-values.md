## Return Values

The return value of a route block determines at least the response body passed
on to the HTTP client, or at least the next middleware in the Rack stack.
Most commonly, this is a string, as in the above examples. But other values are
also accepted.

You can return any object that would either be a valid Rack response, Rack
body object or HTTP status code:

* An Array with three elements: `[status (Fixnum), headers (Hash), response
  body (responds to #each)]`
* An Array with two elements: `[status (Fixnum), response body (responds to
  #each)]`
* An object that responds to `#each` and passes nothing but strings to
  the given block
* A Fixnum representing the status code

That way we can, for instance, easily implement a streaming example:

``` ruby
class Stream
  def each
    100.times { |i| yield "#{i}\n" }
  end
end

get('/') { Stream.new }
```

You can also use the `stream` helper method (described below) to reduce boiler
plate and embed the streaming logic in the route.

