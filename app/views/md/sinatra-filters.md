## Filters

Before filters are evaluated before each request within the same
context as the routes will be and can modify the request and response. Instance
variables set in filters are accessible by routes and templates:

``` ruby
before do
  @note = 'Hi!'
  request.path_info = '/foo/bar/baz'
end

get '/foo/*' do
  @note #=> 'Hi!'
  params['splat'] #=> 'bar/baz'
end
```

After filters are evaluated after each request within the same context as the
routes will be and can also modify the request and response. Instance variables
set in before filters and routes are accessible by after filters:

``` ruby
after do
  puts response.status
end
```

Note: Unless you use the `body` method rather than just returning a String from
the routes, the body will not yet be available in the after filter, since it is
generated later on.

Filters optionally take a pattern, causing them to be evaluated only if the
request path matches that pattern:

``` ruby
before '/protected/*' do
  authenticate!
end

after '/create/:slug' do |slug|
  session[:last_slug] = slug
end
```

Like routes, filters also take conditions:

``` ruby
before :agent => /Songbird/ do
  # ...
end

after '/blog/*', :host_name => 'example.com' do
  # ...
end
```
