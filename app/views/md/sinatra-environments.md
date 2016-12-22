## Environments

There are three predefined `environments`: `"development"`, `"production"` and
`"test"`. Environments can be set through the `RACK_ENV` environment variable.
The default value is `"development"`. In the `"development"` environment all
templates are reloaded between requests, and special `not_found` and `error`
handlers display stack traces in your browser. In the `"production"` and
`"test"` environments, templates are cached by default.

To run different environments, set the `RACK_ENV` environment variable:

``` shell
RACK_ENV=production ruby my_app.rb
```

You can use predefined methods: `development?`, `test?` and `production?` to
check the current environment setting:

``` ruby
get '/' do
  if settings.development?
    "development!"
  else
    "not development!"
  end
end
```