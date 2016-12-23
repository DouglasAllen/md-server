## Static Files

Static files are served from the `./public` directory. You can specify
a different location by setting the `:public_folder` option:

```ruby
set :public_folder, File.dirname(__FILE__) + '/static'
```

Note that the public directory name is not included in the URL. A file
`./public/css/style.css` is made available as
`http://example.com/css/style.css`.

Use the `:static_cache_control` setting (see below) to add
`Cache-Control` header info.
