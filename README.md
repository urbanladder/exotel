exotel
======

Ruby interface to the Exotel API

Install
=======

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
Exotel::Api.sendSMS(post_data)

```
