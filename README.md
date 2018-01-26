# demonstrating very slow connection close behavior

```
export MIX_ENV=prod
export PORT=4000
mix deps.get
mix compile
mix phx.server
```

mid-2015 retina macbook pro, not in docker or a vm or anything.

fast with keepalives on:
```
➜  testapp git:(master) ✗ wrk -c 10 -d 30s -t 2 http://localhost:4000/api/test
Running 30s test @ http://localhost:4000/api/test
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    58.56ms  269.05ms   1.96s    95.08%
    Req/Sec     9.16k     1.08k   11.06k    72.60%
  513425 requests in 30.03s, 97.53MB read
Requests/sec:  17095.42
Transfer/sec:      3.25MB
```

slow with connection: close
```
➜  testapp git:(master) ✗ wrk -c 5 -d 30s -t 2 --header "Connection: Close" http://localhost:4000/api/test
Running 30s test @ http://localhost:4000/api/test
  2 threads and 5 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   678.50us    2.97ms 121.95ms   99.84%
    Req/Sec     2.35k   489.82     3.04k    91.43%
  16381 requests in 30.05s, 3.41MB read
  Socket errors: connect 0, read 4, write 0, timeout 0
Requests/sec:    545.15
Transfer/sec:    116.06KB
```