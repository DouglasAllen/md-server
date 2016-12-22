## Command Line

Sinatra applications can be run directly:

``` shell
ruby myapp.rb [-h] [-x] [-e ENVIRONMENT] [-p PORT] [-o HOST] [-s HANDLER]
```

Options are:

```
-h # help
-p # set the port (default is 4567)
-o # set the host (default is 0.0.0.0)
-e # set the environment (default is development)
-s # specify rack server/handler (default is thin)
-x # turn on the mutex lock (default is off)
```
