### Browser Redirect

You can trigger a browser redirect with the `redirect` helper method:

```ruby
get '/foo' do
  redirect to('/bar')
end
```

Any additional parameters are handled like arguments passed to `halt`:

```ruby
redirect to('/bar'), 303
redirect 'http://google.com', 'wrong place, buddy'
```

You can also easily redirect back to the page the user came from with
`redirect back`:

```ruby
get '/foo' do
  "<a href='/bar'>do something</a>"
end

get '/bar' do
  do_something
  redirect back
end
```

To pass arguments with a redirect, either add them to the query:

```ruby
redirect to('/bar?sum=42')
```

Or use a session:

```ruby
enable :sessions

get '/foo' do
  session[:secret] = 'foo'
  redirect to('/bar')
end

get '/bar' do
  session[:secret]
end
```
