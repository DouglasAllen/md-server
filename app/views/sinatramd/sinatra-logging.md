### Logging

In the request scope, the `logger` helper exposes a `Logger` instance:

```ruby
get '/' do
  logger.info "loading data"
  # ...
end
```

This logger will automatically take your Rack handler's logging settings into
account. If logging is disabled, this method will return a dummy object, so
you do not have to worry about it in your routes and filters.

Note that logging is only enabled for `Sinatra::Application` by default, so if
you inherit from `Sinatra::Base`, you probably want to enable it yourself:

```ruby
class MyApp < Sinatra::Base
  configure :production, :development do
    enable :logging
  end
end
```

To avoid any logging middleware to be set up, set the `logging` setting to
`nil`. However, keep in mind that `logger` will in that case return `nil`. A
common use case is when you want to set your own logger. Sinatra will use
whatever it will find in `env['rack.logger']`.
