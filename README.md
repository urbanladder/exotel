exotel
======

Ruby interface to the Exotel API

Install
=======

```
gem install exotel-api-client
```

Requirements
============

* httparty

Examples
========

### Setup

```ruby
require 'exotel-api-client'

# put your credentials here
account_sid = '<My Exotel SID>'
account_token = '<My Exotel Token>'

# set up a client that will talk to the Exotel REST API
@client = Exotel::Client.new(account_sid, account_token)
```

### Send An SMS

```ruby
from_phone = "<6-character Sender ID>"
to_phone   = "<Phone Number>"
msg = "<SMS content>"

client.send_sms(from_phone, to_phone, msg)
```

### Get Status of An SMS

```ruby
client.SMS.Messages({:sid => '<SmsSid>'})
```

### Get Call Details

```ruby
client.Calls({:sid => '<CallSid>'})
```
