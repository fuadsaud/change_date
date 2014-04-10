change_date
===========

It changes dates (omg):

```ruby
ChangeDate.change_date('01/03/2010 23:00', '+', 4000) # => '04/03/2010 17:40'
```

Btw, it ignores leap years and DST.
