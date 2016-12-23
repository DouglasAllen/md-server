### Halting

To immediately stop a request within a filter or route use:

```ruby
halt
```

You can also specify the status when halting:

```ruby
halt 410
```

Or the body:

```ruby
halt 'this will be the body'
```

Or both:

```ruby
halt 401, 'go away!'
```

With headers:

```ruby
halt 402, {'Content-Type' => 'text/plain'}, 'revenge'
```

It is of course possible to combine a template with `halt`:

```ruby
halt erb(:error)
```