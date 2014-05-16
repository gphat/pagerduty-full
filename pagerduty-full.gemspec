Gem::Specification.new do |s|
  s.name        = 'pagerduty-full'
  s.version     = '0.0.2'
  s.date        = '2014-03-31'
  s.summary     = "PagerDuty API Access"
  s.description = "Access to all of PagerDuty's API"
  s.authors     = ["Cory Watson"]
  s.email       = 'gphat@onemogin.com'
  s.files       = ["lib/pagerduty/full.rb"]
  s.homepage    = 'http://github.com/gphat/pagerduty-full'

  s.add_runtime_dependency 'openssl'
end
