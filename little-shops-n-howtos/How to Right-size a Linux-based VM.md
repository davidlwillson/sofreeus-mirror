How to Right-size a Linux-based VM
==================================

Network
-------

FIXME

Disk
----

FIXME, Remember disks can become overloaded on seeks, throughput, and capacity

CPU
---

```bash
top
```

The maximum useful number of cores is the peak load. To conserve resources, you may want to apply additional modifiers to peak load, like "sustained" or "typical". This will impact performance while the load is higher than the number of cores.

You can read load quickly using only the `top` utility, or thoroughly by using load history for some period of time from SAR or LogicMonitor.

AFAICT, the arrangement of cores to processors doesn't affect performance.

RAM
---

```bash
top
cat /proc/meminfo
```

You have reached the max useful RAM assignment when additional RAM only increases free RAM in the running machine. This can be hard to determine, because you need to run the machine for some period of time and keep track of the minimum free memory over that period.

To right-size quickly, just subtract free memory from total memory, shut down and set the guest memory to the result.
Another guide is to set guest memory to twice active memory. And a last hint: A machine that uses a lot of swap is almost certainly starving for memory.
