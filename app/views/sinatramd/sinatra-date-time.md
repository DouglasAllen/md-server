### Dealing with Date and Time

Sinatra offers a `time_for` helper method that generates a Time object from the
given value. It is also able to convert `DateTime`, `Date` and similar classes:

```ruby
get '/' do
  pass if Time.now > time_for('Dec 23, 2012')
  "still time"
end
```

This method is used internally by `expires`, `last_modified` and akin. You can
therefore easily extend the behavior of those methods by overriding `time_for`
in your application:

```ruby
helpers do
  def time_for(value)
    case value
    when :yesterday then Time.now - 24*60*60
    when :tomorrow  then Time.now + 24*60*60
    else super
    end
  end
end

get '/' do
  last_modified :yesterday
  expires :tomorrow
  "hello"
end
```
