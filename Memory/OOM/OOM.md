# Out of Memory (OOM)

How often the Out of memory (OOM) killer process is running.
This will give you a gauge of how frequent the memory constraint is being hit.

```bash
egrep 'Out of memory:' /var/log/messages
```

Check to see how large the memory consumption is of the processes being killed.

```bash
egrep 'total-vm' /var/log/messages
```

Check the amount of memory on the system, and how much is free/available

```bash
grep MemTotal /proc/meminfo

free -m
```




## URLs

https://access.redhat.com/solutions/2612861

