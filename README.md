fluent-plugin-yammer, a plugin for [Fluentd](http://fluentd.org)
=============

[![Gem Version](https://badge.fury.io/rb/fluent-plugin-yammer.png)](http://badge.fury.io/rb/fluent-plugin-yammer)
[![Build Status](https://travis-ci.org/ts-3156/fluent-plugin-yammer.png?branch=master)](https://travis-ci.org/ts-3156/fluent-plugin-yammer)

## Component
Fluentd Output plugin to process yammer messages with Yammer API.

<!--
## Dependency
-->

## Installation

### native gem

`````
gem install fluent-plugin-yammer
`````

### td-agent gem
`````
/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-yammer
`````

## Output Configuration

### Output Sample
`````
<source>
  type http
  port 8888
</source>

<match notify.yammer>
  type yammer
  access_token YOUR_ACCESS_TOKEN
  group_id     GROUP_ID_YOU_WANT_TO_POST_A_MESSAGE_ON
</match>
`````

### Debug
`````
$ curl http://localhost:8888/notify.yammer -F 'json={"message":"(^^)"}'
`````

## Reference

### REST API | Yammer Developer
https://developer.yammer.com/restapi/

### Writing plugins | Fluentd
http://docs.fluentd.org/articles/plugin-development

### fluent-plugin-twitter
https://github.com/y-ken/fluent-plugin-twitter/

## Copyright

Copyright © 2013- Shinohara Teruki ( https://twitter.com/ts_3156 )

## License

Apache License, Version 2.0
