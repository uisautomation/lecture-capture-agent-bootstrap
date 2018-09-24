# Lecture Capture Agent Bootstrap

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
