### Configuring attack protection

Sinatra is using
[Rack::Protection](https://github.com/rkh/rack-protection#readme) to defend
your application against common, opportunistic attacks. You can easily disable
this behavior (which will open up your application to tons of common
vulnerabilities):

``` ruby
disable :protection
```

To skip a single defense layer, set `protection` to an options hash:

``` ruby
set :protection, :except => :path_traversal
```

You can also hand in an array in order to disable a list of protections:

``` ruby
set :protection, :except => [:path_traversal, :session_hijacking]
```

By default, Sinatra will only set up session based protection if `:sessions`
has been enabled. Sometimes you want to set up sessions on your own, though. In
that case you can get it to set up session based protections by passing the
`:session` option:

``` ruby
use Rack::Session::Pool
set :protection, :session => true
```
