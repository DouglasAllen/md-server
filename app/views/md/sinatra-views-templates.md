## Views / Templates

Each template language is exposed via its own rendering method. These
methods simply return a string:

```ruby
get '/' do
  erb :index
end
```

This renders `views/index.erb`.

Instead of a template name, you can also just pass in the template content
directly:

```ruby
get '/' do
  code = "<%= Time.now %>"
  erb code
end
```

Templates take a second argument, the options hash:

```ruby
get '/' do
  erb :index, :layout => :post
end
```

This will render `views/index.erb` embedded in the
`views/post.erb` (default is `views/layout.erb`, if it exists).

Any options not understood by Sinatra will be passed on to the template
engine:

```ruby
get '/' do
  haml :index, :format => :html5
end
```

You can also set options per template language in general:

```ruby
set :haml, :format => :html5

get '/' do
  haml :index
end
```

Options passed to the render method override options set via `set`.

Available Options:

<dl>
  <dt>locals</dt>
  <dd>
    List of locals passed to the document. Handy with partials.
    Example: <tt>erb "<%= foo %>", :locals => {:foo => "bar"}</tt>
  </dd>

  <dt>default_encoding</dt>
  <dd>
    String encoding to use if uncertain. Defaults to
    <tt>settings.default_encoding</tt>.
  </dd>

  <dt>views</dt>
  <dd>
    Views folder to load templates from. Defaults to <tt>settings.views</tt>.
  </dd>

  <dt>layout</dt>
  <dd>
    Whether to use a layout (<tt>true</tt> or <tt>false</tt>). If it's a
    Symbol, specifies what template to use. Example:
    <tt>erb :index, :layout => !request.xhr?</tt>
  </dd>

  <dt>content_type</dt>
  <dd>
    Content-Type the template produces. Default depends on template language.
  </dd>

  <dt>scope</dt>
  <dd>
    Scope to render template under. Defaults to the application instance. If you
    change this, instance variables and helper methods will not be available.
  </dd>

  <dt>layout_engine</dt>
  <dd>
    Template engine to use for rendering the layout. Useful for languages that
    do not support layouts otherwise. Defaults to the engine used for the
    template. Example: <tt>set :rdoc, :layout_engine => :erb</tt>
  </dd>

  <dt>layout_options</dt>
  <dd>
    Special options only used for rendering the layout. Example:
    <tt>set :rdoc, :layout_options => { :views => 'views/layouts' }</tt>
  </dd>
</dl>

Templates are assumed to be located directly under the `./views` directory. To
use a different views directory:

```ruby
set :views, settings.root + '/templates'
```


One important thing to remember is that you always have to reference templates
with symbols, even if they're in a subdirectory (in this case, use:
`:'subdir/template'` or `'subdir/template'.to_sym`). You must use a symbol
because otherwise rendering methods will render any strings passed to them
directly.

### Literal Templates

```ruby
get '/' do
  haml '%div.title Hello World'
end
```

Renders the template string.

### Available Template Languages

Some languages have multiple implementations. To specify what implementation
to use (and to be thread-safe), you should simply require it first:

```ruby
require 'rdiscount' # or require 'bluecloth'
get('/') { markdown :index }
```

#### Haml Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="http://haml.info/" title="haml">haml</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.haml</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>haml :index, :format => :html5</tt></td>
  </tr>
</table>

#### Erb Templates

<table>
  <tr>
    <td>Dependency</td>
    <td>
      <a href="http://www.kuwata-lab.com/erubis/" title="erubis">erubis</a>
      or erb (included in Ruby)
    </td>
  </tr>
  <tr>
    <td>File Extensions</td>
    <td><tt>.erb</tt>, <tt>.rhtml</tt> or <tt>.erubis</tt> (Erubis only)</td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>erb :index</tt></td>
  </tr>
</table>

#### Builder Templates

<table>
  <tr>
    <td>Dependency</td>
    <td>
      <a href="https://github.com/jimweirich/builder" title="builder">builder</a>
    </td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.builder</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>builder { |xml| xml.em "hi" }</tt></td>
  </tr>
</table>

It also takes a block for inline templates (see example).

#### Nokogiri Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="http://nokogiri.org/" title="nokogiri">nokogiri</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.nokogiri</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>nokogiri { |xml| xml.em "hi" }</tt></td>
  </tr>
</table>

It also takes a block for inline templates (see example).

#### Sass Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="http://sass-lang.com/" title="sass">sass</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.sass</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>sass :stylesheet, :style => :expanded</tt></td>
  </tr>
</table>

#### SCSS Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="http://sass-lang.com/" title="sass">sass</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.scss</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>scss :stylesheet, :style => :expanded</tt></td>
  </tr>
</table>

#### Less Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="http://www.lesscss.org/" title="less">less</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.less</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>less :stylesheet</tt></td>
  </tr>
</table>

#### Liquid Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="http://www.liquidmarkup.org/" title="liquid">liquid</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.liquid</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>liquid :index, :locals => { :key => 'value' }</tt></td>
  </tr>
</table>

Since you cannot call Ruby methods (except for `yield`) from a Liquid
template, you almost always want to pass locals to it.

#### Markdown Templates

<table>
  <tr>
    <td>Dependency</td>
    <td>
      Anyone of:
        <a href="https://github.com/rtomayko/rdiscount" title="RDiscount">RDiscount</a>,
        <a href="https://github.com/vmg/redcarpet" title="RedCarpet">RedCarpet</a>,
        <a href="http://deveiate.org/projects/BlueCloth" title="BlueCloth">BlueCloth</a>,
        <a href="http://kramdown.gettalong.org/" title="kramdown">kramdown</a>,
        <a href="https://github.com/bhollis/maruku" title="maruku">maruku</a>
    </td>
  </tr>
  <tr>
    <td>File Extensions</td>
    <td><tt>.markdown</tt>, <tt>.mkd</tt> and <tt>.md</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>markdown :index, :layout_engine => :erb</tt></td>
  </tr>
</table>

It is not possible to call methods from markdown, nor to pass locals to it.
You therefore will usually use it in combination with another rendering
engine:

```ruby
erb :overview, :locals => { :text => markdown(:introduction) }
```

Note that you may also call the `markdown` method from within other templates:

```ruby
%h1 Hello From Haml!
%p= markdown(:greetings)
```

Since you cannot call Ruby from Markdown, you cannot use layouts written in
Markdown. However, it is possible to use another rendering engine for the
template than for the layout by passing the `:layout_engine` option.

#### Textile Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="http://redcloth.org/" title="RedCloth">RedCloth</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.textile</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>textile :index, :layout_engine => :erb</tt></td>
  </tr>
</table>

It is not possible to call methods from textile, nor to pass locals to it. You
therefore will usually use it in combination with another rendering engine:

```ruby
erb :overview, :locals => { :text => textile(:introduction) }
```

Note that you may also call the `textile` method from within other templates:

```ruby
%h1 Hello From Haml!
%p= textile(:greetings)
```

Since you cannot call Ruby from Textile, you cannot use layouts written in
Textile. However, it is possible to use another rendering engine for the
template than for the layout by passing the `:layout_engine` option.

#### RDoc Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="http://rdoc.sourceforge.net/" title="RDoc">RDoc</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.rdoc</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>rdoc :README, :layout_engine => :erb</tt></td>
  </tr>
</table>

It is not possible to call methods from rdoc, nor to pass locals to it. You
therefore will usually use it in combination with another rendering engine:

```ruby
erb :overview, :locals => { :text => rdoc(:introduction) }
```

Note that you may also call the `rdoc` method from within other templates:

```ruby
%h1 Hello From Haml!
%p= rdoc(:greetings)
```

Since you cannot call Ruby from RDoc, you cannot use layouts written in
RDoc. However, it is possible to use another rendering engine for the
template than for the layout by passing the `:layout_engine` option.

#### AsciiDoc Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="http://asciidoctor.org/" title="Asciidoctor">Asciidoctor</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.asciidoc</tt>, <tt>.adoc</tt> and <tt>.ad</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>asciidoc :README, :layout_engine => :erb</tt></td>
  </tr>
</table>

Since you cannot call Ruby methods directly from an AsciiDoc template, you
almost always want to pass locals to it.

#### Radius Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="https://github.com/jlong/radius" title="Radius">Radius</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.radius</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>radius :index, :locals => { :key => 'value' }</tt></td>
  </tr>
</table>

Since you cannot call Ruby methods directly from a Radius template, you almost
always want to pass locals to it.

#### Markaby Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="http://markaby.github.com/" title="Markaby">Markaby</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.mab</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>markaby { h1 "Welcome!" }</tt></td>
  </tr>
</table>

It also takes a block for inline templates (see example).

#### RABL Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="https://github.com/nesquena/rabl" title="Rabl">Rabl</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.rabl</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>rabl :index</tt></td>
  </tr>
</table>

#### Slim Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="http://slim-lang.com/" title="Slim Lang">Slim Lang</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.slim</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>slim :index</tt></td>
  </tr>
</table>

#### Creole Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="https://github.com/minad/creole" title="Creole">Creole</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.creole</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>creole :wiki, :layout_engine => :erb</tt></td>
  </tr>
</table>

It is not possible to call methods from creole, nor to pass locals to it. You
therefore will usually use it in combination with another rendering engine:

```ruby
erb :overview, :locals => { :text => creole(:introduction) }
```

Note that you may also call the `creole` method from within other templates:

```ruby
%h1 Hello From Haml!
%p= creole(:greetings)
```

Since you cannot call Ruby from Creole, you cannot use layouts written in
Creole. However, it is possible to use another rendering engine for the
template than for the layout by passing the `:layout_engine` option.

#### MediaWiki Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="https://github.com/nricciar/wikicloth" title="WikiCloth">WikiCloth</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.mediawiki</tt> and <tt>.mw</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>mediawiki :wiki, :layout_engine => :erb</tt></td>
  </tr>
</table>

It is not possible to call methods from MediaWiki markup, nor to pass locals to
it. You therefore will usually use it in combination with another rendering
engine:

```ruby
erb :overview, :locals => { :text => mediawiki(:introduction) }
```

Note that you may also call the `mediawiki` method from within other templates:

```ruby
%h1 Hello From Haml!
%p= mediawiki(:greetings)
```

Since you cannot call Ruby from MediaWiki, you cannot use layouts written in
MediaWiki. However, it is possible to use another rendering engine for the
template than for the layout by passing the `:layout_engine` option.

#### CoffeeScript Templates

<table>
  <tr>
    <td>Dependency</td>
    <td>
      <a href="https://github.com/josh/ruby-coffee-script" title="Ruby CoffeeScript">
        CoffeeScript
      </a> and a
      <a href="https://github.com/sstephenson/execjs/blob/master/README.md#readme" title="ExecJS">
        way to execute javascript
      </a>
    </td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.coffee</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>coffee :index</tt></td>
  </tr>
</table>

#### Stylus Templates

<table>
  <tr>
    <td>Dependency</td>
    <td>
      <a href="https://github.com/lucasmazza/ruby-stylus" title="Ruby Stylus">
        Stylus
      </a> and a
      <a href="https://github.com/sstephenson/execjs/blob/master/README.md#readme" title="ExecJS">
        way to execute javascript
      </a>
    </td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.styl</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>stylus :index</tt></td>
  </tr>
</table>

Before being able to use Stylus templates, you need to load `stylus` and
`stylus/tilt` first:

```ruby
require 'sinatra'
require 'stylus'
require 'stylus/tilt'

get '/' do
  stylus :example
end
```

#### Yajl Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="https://github.com/brianmario/yajl-ruby" title="yajl-ruby">yajl-ruby</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.yajl</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td>
      <tt>
        yajl :index,
             :locals => { :key => 'qux' },
             :callback => 'present',
             :variable => 'resource'
      </tt>
    </td>
  </tr>
</table>


The template source is evaluated as a Ruby string, and the
resulting json variable is converted using `#to_json`:

```ruby
json = { :foo => 'bar' }
json[:baz] = key
```

The `:callback` and `:variable` options can be used to decorate the rendered
object:

```javascript
var resource = {"foo":"bar","baz":"qux"};
present(resource);
```

#### WLang Templates

<table>
  <tr>
    <td>Dependency</td>
    <td><a href="https://github.com/blambeau/wlang/" title="WLang">WLang</a></td>
  </tr>
  <tr>
    <td>File Extension</td>
    <td><tt>.wlang</tt></td>
  </tr>
  <tr>
    <td>Example</td>
    <td><tt>wlang :index, :locals => { :key => 'value' }</tt></td>
  </tr>
</table>

Since calling ruby methods is not idiomatic in WLang, you almost always want to
pass locals to it. Layouts written in WLang and `yield` are supported, though.

### Accessing Variables in Templates

Templates are evaluated within the same context as route handlers. Instance
variables set in route handlers are directly accessible by templates:

```ruby
get '/:id' do
  @foo = Foo.find(params['id'])
  haml '%h1= @foo.name'
end
```

Or, specify an explicit Hash of local variables:

```ruby
get '/:id' do
  foo = Foo.find(params['id'])
  haml '%h1= bar.name', :locals => { :bar => foo }
end
```

This is typically used when rendering templates as partials from within
other templates.

### Templates with `yield` and nested layouts

A layout is usually just a template that calls `yield`.
Such a template can be used either through the `:template` option as
described above, or it can be rendered with a block as follows:

```ruby
erb :post, :layout => false do
  erb :index
end
```

This code is mostly equivalent to `erb :index, :layout => :post`.

Passing blocks to rendering methods is most useful for creating nested layouts:

```ruby
erb :main_layout, :layout => false do
  erb :admin_layout do
    erb :user
  end
end
```

This can also be done in fewer lines of code with:

```ruby
erb :admin_layout, :layout => :main_layout do
  erb :user
end
```

Currently, the following rendering methods accept a block: `erb`, `haml`,
`liquid`, `slim `, `wlang`. Also the general `render` method accepts a block.

### Named Templates

Templates may also be defined using the top-level `template` method:

```ruby
template :layout do
  "%html\n  =yield\n"
end

template :index do
  '%div.title Hello World!'
end

get '/' do
  haml :index
end
```

If a template named "layout" exists, it will be used each time a template
is rendered. You can individually disable layouts by passing
`:layout => false` or disable them by default via
`set :haml, :layout => false`:

```ruby
get '/' do
  haml :index, :layout => !request.xhr?
end
```

### Associating File Extensions

To associate a file extension with a template engine, use
`Tilt.register`. For instance, if you like to use the file extension
`tt` for Textile templates, you can do the following:

```ruby
Tilt.register :tt, Tilt[:textile]
```

### Adding Your Own Template Engine

First, register your engine with Tilt, then create a rendering method:

```ruby
Tilt.register :myat, MyAwesomeTemplateEngine

helpers do
  def myat(*args) render(:myat, *args) end
end

get '/' do
  myat :index
end
```

Renders `./views/index.myat`. See https://github.com/rtomayko/tilt to
learn more about Tilt.

### Using Custom Logic for Template Lookup

To implement your own template lookup mechanism you can write your
own `#find_template` method:

```ruby
configure do
  set :views [ './views/a', './views/b' ]
end

def find_template(views, name, engine, &block)
  Array(views).each do |v|
    super(v, name, engine, &block)
  end
end
```

### Inline Templates

Templates may be defined at the end of the source file:

```ruby
require 'sinatra'

get '/' do
  haml :index
end

__END__

@@ layout
%html
  = yield

@@ index
%div.title Hello world.
```

NOTE: Inline templates defined in the source file that requires sinatra are
automatically loaded. Call `enable :inline_templates` explicitly if you
have inline templates in other source files.