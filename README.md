### Notes

```
docker build -t softioc .

docker run -dit -p 5064:5064/tcp -p 5064:5064/udp -p 5065:5065/tcp -p 5065:5065/udp softioc

docker attach <hash from run>

# From another terminal on the host
cainfo test:ao
caget test:ao
caput test:ao 3.14
caget test:ao
```
