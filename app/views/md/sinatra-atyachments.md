### Attachments

You can use the `attachment` helper to tell the browser the response should be
stored on disk rather than displayed in the browser:

``` ruby
get '/' do
  attachment
  "store it!"
end
```

You can also pass it a file name:

``` ruby
get '/' do
  attachment "info.txt"
  "store it!"
end
```
