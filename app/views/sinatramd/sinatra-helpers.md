## Helpers

Use the top-level `helpers` method to define helper methods for use in
route handlers and templates:

```ruby
helpers do
  def bar(name)
    "#{name}bar"
  end
end

get '/:name' do
  bar(params['name'])
end
```

Alternatively, helper methods can be separately defined in a module:

```ruby
module FooUtils
  def foo(name) "#{name}foo" end
end

module BarUtils
  def bar(name) "#{name}bar" end
end

helpers FooUtils, BarUtils
```

The effect is the same as including the modules in the application class.