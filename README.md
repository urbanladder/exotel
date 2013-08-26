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
bundle install --path gem/installation/path
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
```
Send sms as following

```ruby
Exotel::SmsApi.set_credentials("<My Exotel SID>", "<My Exotel Token>")
response_hash = Exotel::SmsApi.send_sms(sms_data)
```
Query for sms status in following manner

1) Using the sms sid generated directly 
```ruby
sms_sid = response_hash["Sid"]
sms_status_hash = Exotel::SmsApi.check_sms_status(sms_sid)
sms_status = sms_status_hash["Status"]
```
2) Using the response hash generated on sending the sms
```ruby
sms_status_hash = Exotel::SmsApi.check_sms_status(response_hash)
sms_status = sms_status_hash["Status"]
```

Contributing
============

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
