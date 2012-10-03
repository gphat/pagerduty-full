Gem for access to the [PagerDuty REST API](http://developer.pagerduty.com/documentation/rest/).

```ruby
require 'date'
require 'pagerduty/full'

# Get some dates to use
start_date = Date.parse("2012-09-24T00:00Z")
end_date = Date.parse("2012-10-09T07:01Z")

pd = PagerDuty::Full.new(apikey = YOURKEY, subdomain = YOURDOMAIN)

# Get list of schedules
sched = pd.Schedule.search()

# Get who is on call
# You can use iso8601, i suppose, if you have newer ruby
oncallthen = pd.Schedule.find(
  id = sid,
  since_date = start_date.strftime("%FT%T%:z"),
  until_date = end_date.strftime("%FT%T%:z")
)

# Get incidents
incs = pd.Incident.search(
  status = "resolved,triggered,acknowledged",
  service = SERVICEID,
  since_date = start_date.strftime("%FT%T%:z"),
  until_date = end_date.strftime("%FT%T%:z")
)
```