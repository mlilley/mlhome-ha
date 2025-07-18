# mlhome-ha

Home automation services docker compose configuration.

Uses a docker macvlan network to put each service on its own IP within the LAN.

## Usage

Copy the provided .env.example to .env, fill it out, and start up the containers with:
```
$ docker compose up --env-file .env -f mlhome-ha.yaml up -d
```

## TrueNAS

If using TrueNAS with static ip, note that that static ip must be defined on the physical interface, not a bridge interface.

## Host Conntainer Reachability

To enable host <-> container communciation, one can add a macvlan interface to the host using an unused ip in the same subnet, and force its use when routing to the container ip range:

```
$ ip link add macvlan0 link enp116s0 type macvlan mode bridge
$ ip addr add 192.168.1.98/24 dev macvlan0.  # .98 is any unused ip on the network
$ ip link set macvlan0 up
```

Then force use of interface when routing to the container macvlan ip range:

```
$ ip route add 192.168.1.32/28 dev macvlan0
```

Note that these settings don't survive a restart, so you'll need to put them in a boot script.

