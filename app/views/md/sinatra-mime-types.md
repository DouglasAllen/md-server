### Mime Types

When using `send_file` or static files you may have mime types Sinatra
doesn't understand. Use `mime_type` to register them by file extension:

``` ruby
configure do
  mime_type :foo, 'text/foo'
end
```

You can also use it with the `content_type` helper:

``` ruby
get '/' do
  content_type :foo
  "foo foo foo"
end
```