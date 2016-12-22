# Sinatra

Sinatra is a [DSL](http://en.wikipedia.org/wiki/Domain-specific_language) for
quickly creating web applications in Ruby with minimal effort:

``` ruby
# myapp.rb
require 'sinatra'

get '/' do
  'Hello world!'
end
```

Install the gem:

``` ruby
gem install sinatra
```

And run with:

``` ruby
ruby myapp.rb
```

View at: http://localhost:4567

It is recommended to also run `gem install thin`, which Sinatra will
pick up if available.
