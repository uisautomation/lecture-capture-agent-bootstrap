# CircleCI configuration

The CircleCI configuration tests that an image can be built from the scripts
here. When a commit lands in master, the built image is deployed to the
repository's GitHub pages branch.

This necessitated configuring CircleCI with a read/write deploy key for the
repository. The private key can be found in the DevOps secrets store. See also
the [CircleCI documentation on GitHub deploy
keys](https://circleci.com/docs/2.0/gh-bb-integration/).
