# Christian's Vagrant Boxes

This repository contains various Vagrant boxes I use for different tasks.

## Prerequisites

Make sure you have [Vagrant](https://www.vagrantup.com/) and a virtualization provider like [VirtualBox](https://www.virtualbox.org/) installed.

## Installation

Clone into this repository, e.g. using:
```
git clone https://github.com/christian-titze/boxes ~/vagrant
```

Change the directory to a box you want to run, e.g. `ctfbox`:
```
cd ~/vagrant/ctfbox
```

Start the box with:
```
vagrant up
```

Vagrant will now download any images it needs and set up the complete environment. Be patient, depending on the box this might take a while!

That's it. Happy Hacking!
