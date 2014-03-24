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

### Setup

```ruby
require 'exotel'

# put your credentials here
account_sid = '<My Exotel SID>'
account_token = '<My Exotel Token>'

# set up a client that will talk to the Exotel REST API
@client = Exotel::Client.new(account_sid, account_token)
```

### Send An SMS

```ruby
sms_data = {
  "From" => "<6-character Sender ID>"
  "To"   => "<Phone Number>"
  "Body" => "<SMS content>"
}

client.Sms.post(sms_data)
```

### Get Status of An SMS

```ruby
client.SMS.Messages({:sid => '<SmsSid>'})
```

### Get Call Details

```ruby
client.Calls({:sid => '<CallSid>'})
```
