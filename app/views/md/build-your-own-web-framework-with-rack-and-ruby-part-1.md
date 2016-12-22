# Build your own web framework with Rack and Ruby part 1

## Quickstart

```ruby
# Gemfile

source 'http://rubygems.org'
# ruby '2.0.0'

gem 'rack'
```

----

```console
$> bundle install
```

----

```ruby
# request_handler.rb
class RequestHandler
  def call(env)
    [200, {}, ["Hello World"]]
  end
end
```

----

```ruby
# brain_rack.ru

require 'rack'
load 'request_handler.rb'

Rack::Handler::WEBrick.run(
  RequestHandler.new,
  Port: 9000
)
```

----

```console
$> rackup
```

----

----

https://github.com/DouglasAllen/brain_rack/tree/master/build-your-own-web-framework-with-rack-and-ruby-part-1

----

----

https://github.com/rack/rack/wiki/Tutorials

----
