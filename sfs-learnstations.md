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
* Apply all available updates
* Install the guest extensions
* Ensure that the guest's screen-resolution updates when the window is resized
* Enable copy and paste
* Export the machine:
```bash
VBoxManage list vms
name=SFS-LearnStation-Ubuntu-Disco
VBoxManage export $name -o $name.ova --vsys 0 --vendor "Software Freedom School" --vendorurl www.sofree.us --version $( date --iso )
# Upload the exported file to Nextcloud
mv $name.ova ~/Nextcloud/SFS-Captains-Booty/VBoxVMs/
# or do it in the browser or whatever
```
* Import and test the machine on at least one other computer. Ensure that:
    - [ ] the Internet is browse-able
    - [ ] screen resolution automatically updates on window re-size
    - [ ] copy and paste from host to guest works


--captains@sofree.us

notes:
- I have switched to PS/2 mouse and disabled audio and USB. I found that USB 2.0 was enabled, which was not needed and was stopping a fresh import from starting on hosts without the proprietary host extensions. --DLW
- I have failed so far to load guest extensions on Fedora 30. --DLW
