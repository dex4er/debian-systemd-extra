# dex4er/debian-systemd-extra

A very small Docker image based on Debian with systemd

## Usage

Run:

```
docker run -itd --privileged \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    --restart=always \
    --name=debian \
    --hostname=debian \
    dex4er/debian-systemd-extra
```

Enter:

```
docker exec -it debian /usr/bin/env TERM=$TERM /bin/bash -i
```
