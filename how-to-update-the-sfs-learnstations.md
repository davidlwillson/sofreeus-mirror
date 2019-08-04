# SFS LearnStations

SFS provides a small collection of GUI virtual machines for obviating OS differences: i.e. giving every learner a Linux box. This allows one set of instructions, or two or three very similar sets of instructions, to work for every learner, where providing well-tested instructions for non-trivial processes on Windows, macOS, and Linux, is difficult.

Currently, the machines are made for VirtualBox and are downloadable from our Nextcloud server here:

https://nextcloud.sofree.us/index.php/s/Kg3z3Z2dB5rOpnH

Teachers should use these machines when writing and rehearsing their demos and pair labs.

SFS no longer provides server machines. Machine-like server containers are easy to get by using Docker. If you need a full server machine, consider building KVM-based VMs on a LearnStation, VMs on a classroom-shared virtualization host, or instances on a private or public cloud. SFS has paid accounts in many public clouds that teachers may use for their classes.


## How to create or update a LearnStation

* Download the very latest ISO for the OS you want. Ubuntu, Fedora, and openSUSE are recommended, since they are the edge distros for the most popular enterprise-class server distros.
* Create a VBox machine with the following specs: 2GB memory, 16GB storage
* Network: NAT (default)
* Username: osadmin
* Password: the standard one that starts with 'Fre' and ends with '-13'
* Install the guest extensions
* Enable automatic screen resolution changes
* Enable copy and paste
* Export the machine: FIXME vboxmanage what?
* Import and test the machine on at least one other computer. Ensure that:
    - [ ] the Internet is browse-able
    - [ ] screen resolution automatically updates on window re-size
    - [ ] copy and paste works
