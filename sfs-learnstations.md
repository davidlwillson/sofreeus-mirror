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
```
$ VBoxManage list vms
"SFS-LS-Ubuntu-Eoan" {a6158f74-db4e-4e30-8e31-b323b5852c71}
$ export name="SFS-LS-Ubuntu-Eoan"
$ VBoxManage export $name -o $name-$( date --iso ).ova --vsys 0 --vendor "Software Freedom School" --vendorurl www.sofree.us --version $( date --iso )
# Upload the exported file to Nextcloud
mv $name-$( date --iso ).ova ~/Nextcloud/SFS-Captains-Booty/VBoxVMs/
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
- Eoan install hung 3x. Adding a second processor seems to be what fixed it. --DLW
- Eoan VM kept losing the mouse in VBox 6.0.14 on Fedora 31. I changed the VM chipset to ICH9 and it seems to be fixed so far. --DLW
- Machines should have auto updates disabled so we don't get package system lock errors when users got to install things. --Alex
- Eoan machine very slow to shut down. Disabled CUPS browser.
  ```bash
  sudo systemctl disable cups-browsed.service
  ```
- Make sure Eoan auto updates is turned off
- Make sure Video Memory is greater than the default 16mb. Black screen issues reported.