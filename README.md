esp-open-sdk-docker
-------------------

This repository provides everything required to run the fantastic [esp-open-sdk](https://github.com/pfalcon/esp-open-sdk) in docker containers.

Why run esp-open-sdk in a docker container?
===========================================

1. No need to install all the dependancies on your local machine.
2. No need to build esp-open-sdk yourself, you can just pull it pre-built from docker hub.
3. Easily build esp-open-sdk yourself if you do want, using the latest source from pfalcon/esp-open-sdk.
4. Ensure you have a consistent build environment - your esp-open-sdk-docker environment will be the same on any machine and the same for everyone else too.
5. Easily switch between `STANDALONE=y` and `STANDALONE=n` versions of esp-open-sdk.

What does esp-open-sdk-docker include?
======================================

- Scripts to build the latest esp-open-sdk into docker images
- Scripts to use those docker images to run esp-open-sdk based commands

Dependancies
============

Written for mac users, likely to work for linux users too. (If you can translate this to Windows please send a pull request.)

* [Homebrew](https://brew.sh/) **Suggested**

  `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)`
* [Git](https://git-scm.com/downloads) **Required**

  `brew install git`
* [Make](https://www.gnu.org/software/make/) - Not sure if the BSD version of make, which comes with mac, will work. Need to test this. To get the GNU version just do:

  `brew install coreutils make`
* [Docker](https://www.docker.com/get-docker) **Required**

  See also https://docs.docker.com/
* [VirtualBox](https://www.virtualbox.org/)  **Suggested**

  At least I used this for the usb port mapping bit, you might be able to do the same with HyperKit.

Building or Pulling
===================

```bash
$ git clone esp-open-sdk-docker
$ cd esp-open-sdk-docker
$ make containerimages
```

You could now have a number of docker images. Take a look:

```bash
$ docker images --filter=reference='esp-open-sdk/*'
esp-open-sdk/source        # safe to ignore
esp-open-sdk/dependencies  # safe to ignore
esp-open-sdk/standalone    # SDK built with STANDALONE=y
esp-open-sdk/bare          # SDK built with STANDALONE=n
esp-open-sdk/serialtools   # Some useful serial debugging tools
```

If you only want one of these, for example the standalone build, you can do that with:

```bash
$ cd containerimages
$ make standalone
```

If you don't want to build your own images you can skip the `git clone` and `make` steps and just pull the latest from docker hub:

```bash
$ docker pull esp-open-sdk/standalone:latest
```

Usage
=====
