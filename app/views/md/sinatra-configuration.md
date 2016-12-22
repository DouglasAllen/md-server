## Configuration

Run once, at startup, in any environment:

``` ruby
configure do
  # setting one option
  set :option, 'value'

  # setting multiple options
  set :a => 1, :b => 2

  # same as `set :option, true`
  enable :option

  # same as `set :option, false`
  disable :option

  # you can also have dynamic settings with blocks
  set(:css_dir) { File.join(views, 'css') }
end
```

Run only when the environment (`RACK_ENV` environment variable) is set to
`:production`:

``` ruby
configure :production do
  ...
end
```

Run when the environment is set to either `:production` or `:test`:

```ruby
configure :production, :test do
  ...
end
```

You can access those options via `settings`:

``` ruby
configure do
  set :foo, 'bar'
end

get '/' do
  settings.foo? # => true
  settings.foo  # => 'bar'
  ...
end
```
http://www.sinatrarb.com/configuration.html
