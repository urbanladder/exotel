exotel
======

Ruby interface to the Exotel API

Install
=======

Add this line to your application's Gemfile:

```
    gem 'exotel'
```

And then execute:

```
    $ bundle install --path gem/installation/path/for/application
```

Or install it yourself as:

```
gem install exotel
```

Requirements
============

* httparty

Examples
========

```ruby
sms_data = {
  "From" => "<6-character Sender ID>"
  "To"   => "<Phone Number>"
  "Body" => "<SMS content>"
}

Exotel::Api.set_credentials("<My Exotel SID>", "<My Exotel Token>")
Exotel::Api.send_sms(post_data)

```

Contributing
============

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
