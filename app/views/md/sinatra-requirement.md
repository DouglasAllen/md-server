## Requirement

http://www.sinatrarb.com/intro.html#Requirement

The following Ruby versions are officially supported:
<dl>
  <dt>Ruby 1.8.7</dt>
  <dd>
    1.8.7 is fully supported, however, if nothing is keeping you from it, we
    recommend upgrading or switching to JRuby or Rubinius. Support for 1.8.7
    will not be dropped before Sinatra 2.0. Ruby 1.8.6 is no longer supported.
  </dd>

  <dt>Ruby 1.9.2</dt>
  <dd>
    1.9.2 is fully supported. Do not use 1.9.2p0, as it is known to cause
    segmentation faults when running Sinatra. Official support will continue
    at least until the release of Sinatra 1.5.
  </dd>

  <dt>Ruby 1.9.3</dt>
  <dd>
    1.9.3 is fully supported and recommended. Please note that switching to 1.9.3
    from an earlier version will invalidate all sessions. 1.9.3 will be supported
    until the release of Sinatra 2.0.
  </dd>

  <dt>Ruby 2.x</dt>
  <dd>
    2.x is fully supported and recommended. There are currently no plans to drop
    official support for it.
  </dd>

  <dt>Rubinius</dt>
  <dd>
    Rubinius is officially supported (Rubinius >= 2.x). It is recommended to
    <tt>gem install puma</tt>.
  </dd>

  <dt>JRuby</dt>
  <dd>
    The latest stable release of JRuby is officially supported. It is not
    recommended to use C extensions with JRuby. It is recommended to
    <tt>gem install trinidad</tt>.
  </dd>
</dl>

We also keep an eye on upcoming Ruby versions.

The following Ruby implementations are not officially supported but still are
known to run Sinatra:

* Older versions of JRuby and Rubinius
* Ruby Enterprise Edition
* MacRuby, Maglev, IronRuby
* Ruby 1.9.0 and 1.9.1 (but we do recommend against using those)

Not being officially supported means if things only break there and not on a
supported platform, we assume it's not our issue but theirs.

We also run our CI against ruby-head (future releases of MRI), but we can't
guarantee anything, since it is constantly moving. Expect upcoming 2.x releases
to be fully supported.

Sinatra should work on any operating system supported by the chosen Ruby
implementation.

If you run MacRuby, you should `gem install control_tower`.

Sinatra currently doesn't run on Cardinal, SmallRuby, BlueRuby or any
Ruby version prior to 1.8.7.

## The Bleeding Edge

If you would like to use Sinatra's latest bleeding-edge code, feel free to run your
application against the master branch, it should be rather stable.

We also push out prerelease gems from time to time, so you can do a

``` shell
gem install sinatra --pre
```

to get some of the latest features.

### With Bundler

If you want to run your application with the latest Sinatra, using
[Bundler](http://gembundler.com/) is the recommended way.

First, install bundler, if you haven't:

``` shell
gem install bundler
```

Then, in your project directory, create a `Gemfile`:

```ruby
source 'https://rubygems.org'
gem 'sinatra', :github => "sinatra/sinatra"

# other dependencies
gem 'haml'                    # for instance, if you use haml
gem 'activerecord', '~> 3.0'  # maybe you also need ActiveRecord 3.x
```

Note that you will have to list all your application's dependencies in the `Gemfile`.
Sinatra's direct dependencies (Rack and Tilt) will, however, be automatically
fetched and added by Bundler.

Now you can run your app like this:

``` shell
bundle exec ruby myapp.rb
```

### Roll Your Own

Create a local clone and run your app with the `sinatra/lib` directory
on the `$LOAD_PATH`:

``` shell
cd myapp
git clone git://github.com/sinatra/sinatra.git
ruby -I sinatra/lib myapp.rb
```

To update the Sinatra sources in the future:

``` shell
cd myapp/sinatra
git pull
```

### Install Globally

You can build the gem on your own:

``` shell
git clone git://github.com/sinatra/sinatra.git
cd sinatra
rake sinatra.gemspec
rake install
```

If you install gems as root, the last step should be:

``` shell
sudo rake install
```
