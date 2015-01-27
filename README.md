# azendoo
The azendoo gem

Example:

```ruby
require 'azendoo'

Azendoo::Conf.configure do |c|
  c.email = 'tbishop@yopmail.com'
  c.password = 'please'
end

include Azendoo

User.me
Task.where(done: false)
```