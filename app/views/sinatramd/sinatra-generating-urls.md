### Generating URLs

For generating URLs you should use the `url` helper method, for instance, in
Haml:

```ruby
%a{:href => url('/foo')} foo
```

It takes reverse proxies and Rack routers into account, if present.

This method is also aliased to `to` (see below for an example).
