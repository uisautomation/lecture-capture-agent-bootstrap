# Lecture Capture Agent Bootstrap

> **This repository has been moved to https://gitlab.developers.cam.ac.uk/uis/devops/lecture-capture/agent-bootstrap/**

This directory contains a Docker-ised script to build our [custom Ubuntu image for
a Lecture Capture Agent](https://uisautomation.github.io/lecture-capture-agent-bootstrap/lc-agent.iso).

## Short version

```bash
$ docker run --rm -v $PWD/images:/images $(docker build -q .)
```

After some time a new lecture capture agent image is available at
``images/lc-agent.iso``.

## Source

The contents of this repository were originally based on the
[core-process/linux-unattended-installation](https://github.com/core-process/linux-unattended-installation)
repository. The [original README](original-readme.md) contains some more
details.

## Changing image name

By default, the script writes the output image to ``/images/lc-agent.iso``. The
basename of this file is configurable via the ``IMAGE_NAME`` environment
variable. So, with ``IMAGE_NAME=my-image``, the script writes the image to
``/images/my-image.iso``.

## Deploy keys

The list of keys which can log in as root for deploying the boxes is contained
in the ``deploy-keys.pub`` file. The private halves of those keys can be found
in the DevOps Division's secrets store.

## BIOS configuration

Existing PCs have possibly been configured with legacy (BIOS) boot enabled.
Going forward (and now necessary for the Dell Optiplex 7060's with NVMe SSDs)
we should be using UEFI booting.

The following BIOS settings are for Dell PC's but similar options should be
available on other hardware.

Press ``F2`` to enter BIOS on boot.
* __General__
  * __Boot Sequence__
    * Boot List Option = UEFI
  * __Advanced Boot Options__
    * Enable Legacy Option ROMs = _unchecked_
  * __UEFI Boot Path Security__
    * Always, Except Internal HDD
* __System Configuration__
  * __SATA Operation__
    * AHCI __[1]__
* __Secure Boot__
  * __Secure Boot Enable__
    * Disabled __[2]__

__[1]__ - Necessary for unattended installation boot media to see the NVMe in a Dell Optiplex 7060.

__[2]__ - To allow use of unsigned Intel network driver

For PCs in the wild, the Admin Password should also be enabled under Security
to prevent tampering.

## Booting from USB

If the internal disk already has bootable partitions then these may be higher in
the boot order than the USB drive. Rather than change the ordering in the BIOS,
it is easier to just press ``F12`` during boot to bring up a boot menu where
the USB device can be selected.
