### Setting Body, Status Code and Headers

It is possible and recommended to set the status code and response body with the
return value of the route block. However, in some scenarios you might want to
set the body at an arbitrary point in the execution flow. You can do so with the
`body` helper method. If you do so, you can use that method from there on to
access the body:

```ruby
get '/foo' do
  body "bar"
end

after do
  puts body
end
```

It is also possible to pass a block to `body`, which will be executed by the
Rack handler (this can be used to implement streaming, see "Return Values").

Similar to the body, you can also set the status code and headers:

```ruby
get '/foo' do
  status 418
  headers \
    "Allow"   => "BREW, POST, GET, PROPFIND, WHEN",
    "Refresh" => "Refresh: 20; http://www.ietf.org/rfc/rfc2324.txt"
  body "I'm a tea pot!"
end
```

Like `body`, `headers` and `status` with no arguments can be used to access
their current values.
