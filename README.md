## Sidekiq Dashboard

Launch sidekiq dashboard standalone.

## Usage

#### bundle install
```
$ bundle install --path vendor/bundle
```

#### basic auth
edit conrig.ru

```
...
  use Rack::Auth::Basic, "Protected Area" do |username, password|
    username == 'sidekiq' && password == 'sidekiq'
  end
...
```

#### start unicorn
```
$ bundle exec unicorn -c config/unicorn.rb [-p PORT] -D
```

```
ex) $ bundle exec unicorn -c config/unicorn.rb -p 9494 -D
```

#### access dashboard
[http://HOSTNAME:9494/sidekiq](http://HOSTNAME:9494/sidekiq)
