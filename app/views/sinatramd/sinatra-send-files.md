### Sending Files

To return the contents of a file as the response, you can use the `send_file`
helper method:

```ruby
get '/' do
  send_file 'foo.png'
end
```

It also takes options:

```ruby
send_file 'foo.png', :type => :jpg
```

The options are:

<dl>
  <dt>filename</dt>
    <dd>File name to be used in the response, defaults to the real file name.</dd>

  <dt>last_modified</dt>
    <dd>Value for Last-Modified header, defaults to the file's mtime.</dd>

  <dt>type</dt>
    <dd>Value for Content-Type header, guessed from the file extension if
    missing.</dd>

  <dt>disposition</dt>
    <dd>
      Value for Content-Disposition header, possible values: <tt>nil</tt>
      (default), <tt>:attachment</tt> and <tt>:inline</tt>
    </dd>

  <dt>length</dt>
    <dd>Value for Content-Length header, defaults to file size.</dd>

  <dt>status</dt>
    <dd>
      Status code to be sent. Useful when sending a static file as an error page.

      If supported by the Rack handler, other means than streaming from the Ruby
      process will be used. If you use this helper method, Sinatra will
      automatically handle range requests.
    </dd>
</dl>
