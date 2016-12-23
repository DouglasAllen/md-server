### Available Settings

http://www.sinatrarb.com/intro.html#Available%20Settings

<dl>
  <dt>absolute_redirects</dt>
  <dd>
    If disabled, Sinatra will allow relative redirects, however, Sinatra will no
    longer conform with RFC 2616 (HTTP 1.1), which only allows absolute redirects.
  </dd>
  <dd>
    Enable if your app is running behind a reverse proxy that has not been set up
    properly. Note that the <tt>url</tt> helper will still produce absolute URLs, unless you
    pass in <tt>false</tt> as the second parameter.
  </dd>
  <dd>Disabled by default.</dd>

  <dt>add_charset</dt>
  <dd>
    Mime types the <tt>content_type</tt> helper will automatically add the charset info to.
    You should add to it rather than overriding this option:
    <tt>settings.add_charset << "application/foobar"</tt>
  </dd>

  <dt>app_file</dt>
  <dd>
    Path to the main application file, used to detect project root, views and public
    folder and inline templates.
  </dd>

  <dt>bind</dt>
  <dd>IP address to bind to (default: <tt>0.0.0.0</tt> <em>or</em>
  <tt>localhost</tt> if your `environment` is set to development). Only used
  for built-in server.</dd>

  <dt>default_encoding</dt>
  <dd>Encoding to assume if unknown (defaults to <tt>"utf-8"</tt>).</dd>

  <dt>dump_errors</dt>
  <dd>Display errors in the log.</dd>

  <dt>environment</dt>
  <dd>
    Current environment. Defaults to <tt>ENV['RACK_ENV']</tt>, or
    <tt>"development"</tt> if not available.
  </dd>

  <dt>logging</dt>
  <dd>Use the logger.</dd>

  <dt>lock</dt>
  <dd>
    Places a lock around every request, only running processing on request
    per Ruby process concurrently.
  </dd>
  <dd>Enabled if your app is not thread-safe. Disabled per default.</dd>

  <dt>method_override</dt>
  <dd>
    Use <tt>_method</tt> magic to allow put/delete forms in browsers that
    don't support it.
  </dd>

  <dt>port</dt>
  <dd>Port to listen on. Only used for built-in server.</dd>

  <dt>prefixed_redirects</dt>
  <dd>
    Whether or not to insert <tt>request.script_name</tt> into redirects if no
    absolute path is given. That way <tt>redirect '/foo'</tt> would behave like
    <tt>redirect to('/foo')</tt>. Disabled per default.
  </dd>

  <dt>protection</dt>
  <dd>Whether or not to enable web attack protections. See protection section
  above.</dd>

  <dt>public_dir</dt>
  <dd>Alias for <tt>public_folder</tt>. See below.</dd>

  <dt>public_folder</dt>
  <dd>
    Path to the folder public files are served from. Only used if static
    file serving is enabled (see <tt>static</tt> setting below). Inferred from
    <tt>app_file</tt> setting if not set.
  </dd>

  <dt>reload_templates</dt>
  <dd>
    Whether or not to reload templates between requests. Enabled in development
    mode.
  </dd>

  <dt>root</dt>
  <dd>
    Path to project root folder. Inferred from <tt>app_file</tt> setting if not
    set.
  </dd>

  <dt>raise_errors</dt>
  <dd>
    Raise exceptions (will stop application). Enabled by default when
    <tt>environment</tt> is set to <tt>"test"</tt>, disabled otherwise.
  </dd>

  <dt>run</dt>
  <dd>
    If enabled, Sinatra will handle starting the web server. Do not
    enable if using rackup or other means.
  </dd>

  <dt>running</dt>
  <dd>Is the built-in server running now? Do not change this setting!</dd>

  <dt>server</dt>
  <dd>
    Server or list of servers to use for built-in server. Order indicates
    priority, default depends on Ruby implementation.
  </dd>

  <dt>sessions</dt>
  <dd>
    Enable cookie-based sessions support using <tt>Rack::Session::Cookie</tt>.
    See 'Using Sessions' section for more information.
  </dd>

  <dt>show_exceptions</dt>
  <dd>
    Show a stack trace in the browser when an exception happens. Enabled by
    default when <tt>environment</tt> is set to <tt>"development"</tt>,
    disabled otherwise.
  </dd>
  <dd>
    Can also be set to <tt>:after_handler</tt> to trigger app-specified error
    handling before showing a stack trace in the browser.
  </dd>

  <dt>static</dt>
  <dd>Whether Sinatra should handle serving static files.</dd>
  <dd>Disable when using a server able to do this on its own.</dd>
  <dd>Disabling will boost performance.</dd>
  <dd>
    Enabled per default in classic style, disabled for modular apps.
  </dd>

  <dt>static_cache_control</dt>
  <dd>
    When Sinatra is serving static files, set this to add <tt>Cache-Control</tt>
    headers to the responses. Uses the <tt>cache_control</tt> helper. Disabled
    by default.
  </dd>
  <dd>
    Use an explicit array when setting multiple values:
    <tt>set :static_cache_control, [:public, :max_age => 300]</tt>
  </dd>

  <dt>threaded</dt>
  <dd>
    If set to <tt>true</tt>, will tell Thin to use <tt>EventMachine.defer</tt>
    for processing the request.
  </dd>

  <dt>traps</dt>
  <dd>Whether Sinatra should handle system signals.</dd>

  <dt>views</dt>
  <dd>
    Path to the views folder. Inferred from <tt>app_file</tt> setting if
    not set.
  </dd>

  <dt>x_cascade</dt>
  <dd>
    Whether or not to set the X-Cascade header if no route matches.
    Defaults to <tt>true</tt>.
  </dd>
</dl>
