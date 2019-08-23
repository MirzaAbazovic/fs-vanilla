# Vanilla FreeSWITCH on Debian 10


Build it:

```bash
docker build -t fs-vanilla github.com/MirzaAbazovic/fs-vanilla
```

Run it:

```
docker run --network host fs-vanilla
```

See status:
* telnet localhost 8021
* auth ClueCon (hit enter twice)
* api status (hit enter twice)

```
❯ telnet localhost 8021
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
Content-Type: auth/request

auth ClueCon

Content-Type: command/reply
Reply-Text: +OK accepted

api status

Content-Type: api/response
Content-Length: 340

UP 0 years, 0 days, 0 hours, 0 minutes, 14 seconds, 68 milliseconds, 888 microseconds
FreeSWITCH (Version 1.8.7 -8-6047ebddfc 64bit) is ready
0 session(s) since startup
0 session(s) - peak 0, last 5min 0 
0 session(s) per Sec out of max 30, peak 0, last 5min 0 
1000 session(s) max
min idle cpu 0.00/97.37
Current Stack Size/Max 240K/8192K
```